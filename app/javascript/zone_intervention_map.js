(function () {
  const DEPS = [
    {
      files: ["/geo/95-val-doise-simplified.geojson", "/geo/95-val-doise.geojson"],
      color: "#15803d", // Vert - Val d'Oise
      label: "Val d'Oise (95)"
    },
    {
      files: ["/geo/60-oise-simplified.geojson", "/geo/60-oise.geojson"],
      color: "#b45309", // Ambre - Oise
      label: "Oise (60)"
    },
    {
      files: ["/geo/78-yvelines-simplified.geojson", "/geo/78-yvelines.geojson"],
      color: "#2563eb", // Bleu - Yvelines
      label: "Yvelines (78)"
    }
  ];

  const BUSINESS = {
    name: "DUBOIS SERVICES",
    address: "30 Rte de Pontoise, 95540 Méry-sur-Oise",
    // ✅ Coordonnées GPS fixes (provenant du lien Google Maps)
    latlng: [49.059594, 2.1655372],
    mapsPlaceUrl:
      "https://www.google.com/maps/search/?api=1&query=" +
      encodeURIComponent("DUBOIS SERVICES 30 Rte de Pontoise, 95540 Méry-sur-Oise"),
    mapsDirUrl:
      "https://www.google.com/maps/dir/?api=1&destination=" +
      encodeURIComponent("DUBOIS SERVICES 30 Rte de Pontoise, 95540 Méry-sur-Oise"),
    // Lien vers les avis Google (cliquable dans la popup)
    reviewsUrl: "https://www.google.com/search?sca_esv=e5fbcc06bbcda539&rlz=1C5CHFA_enFR980FR980&si=AMgyJEtREmoPL4P1I5IDCfuA8gybfVI2d5Uj7QMwYCZHKDZ-E1F1MzApZtvA_0bqFLM5wOvxn3ttgxDbt27C6N5Z5Vpd13tsC_arYDbZA5l0FA66y6a_EAmoMgyJq4r9dQjpPG-QUbKA&q=DUBOIS+SERVICES+Avis&sa=X&ved=2ahUKEwj35Y_VxOiQAxVkY6QEHWWkCJ0Q0bkNegQIQhAE&biw=1186&bih=1048&dpr=0.8"
  };

  let mapInstance = null;
  let isInitializing = false;

  async function fetchFirstAvailable(urls) {
    for (const url of urls) {
      try {
        const res = await fetch(url, { cache: "force-cache" });
        if (res.ok) return res.json();
      } catch (_) {}
    }
    throw new Error("Aucun fichier GeoJSON disponible: " + urls.join(", "));
  }

  function toFeatureCollection(geo) {
    if (!geo) throw new Error("GeoJSON vide");
    if (geo.type === "FeatureCollection") return geo;
    if (geo.type === "Feature") return { type: "FeatureCollection", features: [geo] };
    if (geo.type === "Polygon" || geo.type === "MultiPolygon") {
      return { type: "FeatureCollection", features: [{ type: "Feature", properties: {}, geometry: geo }] };
    }
    throw new Error("Type GeoJSON non supporté: " + geo.type);
  }

  async function loadAllDepartments() {
    const allFeatures = [];
    for (const dep of DEPS) {
      const geo = await fetchFirstAvailable(dep.files);
      const fc = toFeatureCollection(geo);
      fc.features.forEach(f => {
        f.properties = f.properties || {};
        f.properties._color = dep.color;
        f.properties._label = dep.label;
        allFeatures.push(f);
      });
    }
    return { type: "FeatureCollection", features: allFeatures };
  }

  function removeExistingLegend() {
    const old = document.querySelector(".legend-zone");
    if (old && old.parentNode) old.parentNode.removeChild(old);
  }

  function addBusinessPin(map) {
    const marker = L.marker(BUSINESS.latlng).addTo(map);
    const popupHtml = `
      <div style="min-width:220px; line-height:1.35;">
        <div style="font-weight:700; font-size:15px; margin-bottom:2px;">${BUSINESS.name}</div>
        <div style="font-size:13px; color:#374151; margin-bottom:6px;">${BUSINESS.address}</div>
        <div style="font-size:13px; color:#111827; margin-bottom:8px;">${BUSINESS.ratingText}</div>
        <div style="display:flex; gap:10px; align-items:center; flex-wrap:wrap;">
          <a href="${BUSINESS.mapsDirUrl}" target="_blank" rel="noopener" style="color:#2563eb; font-weight:600; text-decoration:underline;">Itinéraires</a>
          <a href="${BUSINESS.mapsPlaceUrl}" target="_blank" rel="noopener" style="color:#2563eb; text-decoration:underline;">Agrandir le plan</a>
        </div>
      </div>`;
    marker.bindPopup(popupHtml);
    marker.openPopup();

    return marker;
  }

  async function createMap() {
    const mapEl = document.getElementById("map");
    if (!mapEl || typeof L === "undefined") return;
    
    // Éviter les initialisations multiples simultanées
    if (isInitializing) return;
    isInitializing = true;

    // Récupérer les valeurs depuis les data attributes
    const rating = mapEl.dataset.rating ? parseFloat(mapEl.dataset.rating) : 5;
    const reviews = mapEl.dataset.reviews ? parseInt(mapEl.dataset.reviews) : 53;
    const reviewsUrl = mapEl.dataset.reviewsUrl || BUSINESS.reviewsUrl;
    
    // Mettre à jour BUSINESS avec les valeurs dynamiques
    BUSINESS.rating = rating;
    BUSINESS.reviews = reviews;
    BUSINESS.reviewsUrl = reviewsUrl;
    BUSINESS.ratingText = rating.toFixed(1).replace('.', ',') + " · <a href=\"" + reviewsUrl + "\" target=\"_blank\" rel=\"noopener\" style=\"color:#2563eb;text-decoration:underline;\">" + reviews + " avis</a>";

    // Supprimer l'instance existante si elle existe
    if (mapInstance) {
      try {
        mapInstance.remove();
      } catch (e) {
        // Ignorer les erreurs si la carte est déjà supprimée
      }
      mapInstance = null;
    }
    
    // Vérifier si le conteneur a déjà été initialisé par Leaflet
    if (mapEl._leaflet_id) {
      delete mapEl._leaflet_id;
    }

    // Détecter si on est sur mobile
    const isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ||
                     (window.innerWidth <= 768);

    try {
      // Sur mobile, désactiver le dragging avec 1 doigt pour éviter les conflits avec le scroll
      // Le zoom avec 2 doigts reste actif
      mapInstance = L.map("map", {
        scrollWheelZoom: false,
        dragging: !isMobile, // Désactiver le drag avec 1 doigt sur mobile
        touchZoom: true, // Permettre le zoom avec 2 doigts
        doubleClickZoom: true,
        boxZoom: false,
        keyboard: false
      });
    } catch (e) {
      console.error("[Carte départements] Erreur lors de la création de la carte:", e);
      isInitializing = false;
      return;
    }
    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      maxZoom: 19,
      attribution: "&copy; OpenStreetMap"
    }).addTo(mapInstance);

    const fc = await loadAllDepartments();

    const layer = L.geoJSON(fc, {
      style: f => ({
        color: f.properties._color,
        weight: 2,
        opacity: 0.95,
        fillColor: f.properties._color,
        fillOpacity: 0.25
      }),
      onEachFeature: (f, l) => {
        if (f.properties?._label) l.bindPopup(`<strong>${f.properties._label}</strong>`);
      }
    }).addTo(mapInstance);

    const marker = addBusinessPin(mapInstance);

    // ✅ Pas de fitBounds pour éviter l'effet zoom/dezoom.
    // On centre sur le centre des départements (bounds) puis on fixe un zoom direct.
    const bounds = layer.getBounds().extend(marker.getLatLng());
    const center = bounds.getCenter();
    mapInstance.setView(center, 8, { animate: false }); // ← ajuste le "11" pour zoom +/- près

    // Légende unique
    removeExistingLegend();
    const legend = L.control({ position: "bottomleft" });
    legend.onAdd = function () {
      const div = L.DomUtil.create("div", "legend-zone");
      div.style.background = "white";
      div.style.padding = "8px 10px";
      div.style.borderRadius = "8px";
      div.style.boxShadow = "0 2px 8px rgba(0,0,0,.15)";
      div.innerHTML = `
        <div style="font-weight:600;margin-bottom:6px">Zone d'intervention</div>
        ${DEPS.map(d => `
          <div style="display:flex;align-items:center;gap:8px;margin:2px 0;">
            <span style="display:inline-block;width:12px;height:12px;border-radius:3px;background:${d.color}"></span>
            <span>${d.label}</span>
          </div>
        `).join("")}
      `;
      return div;
    };
    legend.addTo(mapInstance);
    
    isInitializing = false;
  }

  function init() {
    // Vérifier si le conteneur existe sur la page
    const mapEl = document.getElementById("map");
    if (!mapEl) {
      // Pas de carte sur cette page, nettoyer l'instance si elle existe
      if (mapInstance) {
        try {
          mapInstance.remove();
        } catch (e) {
          // Ignorer les erreurs
        }
        mapInstance = null;
      }
      isInitializing = false;
      return;
    }
    
    // Si la carte est déjà initialisée et que le conteneur existe toujours, ne pas réinitialiser
    if (mapInstance && mapEl._leaflet_id) {
      return;
    }
    
    createMap().catch(err => {
      console.error("[Carte départements]", err);
      isInitializing = false;
    });
  }

  // Fonction pour nettoyer complètement la carte
  function cleanup() {
    if (mapInstance) {
      try {
        mapInstance.remove();
      } catch (e) {
        // Ignorer les erreurs
      }
      mapInstance = null;
    }
    isInitializing = false;
    
    // Nettoyer aussi le conteneur
    const mapEl = document.getElementById("map");
    if (mapEl && mapEl._leaflet_id) {
      delete mapEl._leaflet_id;
    }
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", init);
  } else {
    init();
  }
  
  // Nettoyer avant de charger une nouvelle page
  document.addEventListener("turbo:before-cache", cleanup);
  
  // Initialiser après le chargement
  document.addEventListener("turbo:load", init);
  document.addEventListener("turbo:frame-load", init);
})();

