// Charge GTM uniquement quand marketing est accepté
function loadGTM() {
  if (window.__gtmLoaded) return;
  window.__gtmLoaded = true;

  window.dataLayer = window.dataLayer || [];
  window.dataLayer.push({ 'gtm.start': new Date().getTime(), event: 'gtm.js' });

  var gtmScript = document.createElement('script');
  gtmScript.async = true;
  gtmScript.src = 'https://www.googletagmanager.com/gtm.js?id=GTM-W5QHLZ6P';
  document.head.appendChild(gtmScript);
}

// Charge gtag (Google Ads) uniquement quand analytics est accepté
function loadGtagAds() {
  if (window.__gtagLoaded) return;
  window.__gtagLoaded = true;

  var gtagScript = document.createElement('script');
  gtagScript.async = true;
  gtagScript.src = 'https://www.googletagmanager.com/gtag/js?id=AW-11134326763';
  document.head.appendChild(gtagScript);

  gtagScript.onload = function() {
    window.dataLayer = window.dataLayer || [];
    function gtag(){ dataLayer.push(arguments); }
    window.gtag = gtag;

    gtag('js', new Date());
    gtag('config', 'AW-11134326763');
  };
}

// Applique le consent courant (appelé après chaque init / changement)
function applyConsent() {
  try {
    if (window.CookieConsent) {
      if (CookieConsent.acceptedCategory('analytics')) {
        loadGtagAds();
      }
      if (CookieConsent.acceptedCategory('marketing')) {
        loadGTM();
      }

      window.dataLayer = window.dataLayer || [];
      window.dataLayer.push({
        event: 'cookie_consent_update',
        analytics: CookieConsent.acceptedCategory('analytics'),
        marketing: CookieConsent.acceptedCategory('marketing')
      });
    }
  } catch (e) {
    console.warn('Erreur applyConsent', e);
  }
}

// Init CookieConsent (à appeler sur load ET turbo:load)
function initCookieConsent() {
  if (!window.CookieConsent) return;

  // ⚠️ Ne pas relancer run() à chaque navigation, sinon ça bug
  if (window.__ccInitialized) {
    // On est sur une nouvelle page Turbo : on ré-applique juste le consent
    applyConsent();
    return;
  }
  window.__ccInitialized = true;

  CookieConsent.run({
    // ✅ accroche sur l’élément permanent
    root: '#cc-root',

    guiOptions: {
      consentModal: {
        layout: "box",
        position: "bottom center",
        equalWeightButtons: true,
        flipButtons: false
      },
      preferencesModal: {
        layout: "box",
        position: "right",
        equalWeightButtons: true
      }
    },
    categories: {
      necessary: {
        enabled: true,
        readOnly: true
      },
      analytics: {
        enabled: true   // ✅ pré-coché
      },
      marketing: {
        enabled: true   // ✅ pré-coché
      }
    },
    language: {
      default: "fr",
      translations: {
        fr: {
          consentModal: {
            title: "Gestion des cookies",
            description: "Nous utilisons des cookies pour analyser l’audience et améliorer nos services. Vous pouvez accepter, refuser ou personnaliser vos choix.",
            acceptAllBtn: "Tout accepter",
            acceptNecessaryBtn: "Tout refuser",
            showPreferencesBtn: "Personnaliser"
          },
          preferencesModal: {
            title: "Préférences des cookies",
            acceptAllBtn: "Tout accepter",
            acceptNecessaryBtn: "Tout refuser",
            savePreferencesBtn: "Enregistrer mes choix",
            sections: [
              {
                title: "Cookies nécessaires",
                description: "Indispensables au bon fonctionnement du site (sécurité, formulaires, choix d’affichage, etc.).",
                linkedCategory: "necessary"
              },
              {
                title: "Mesure d’audience (Google Analytics / Ads)",
                description: "Nous permet de mesurer la fréquentation du site et d’identifier les pages à améliorer.",
                linkedCategory: "analytics"
              },
              {
                title: "Publicité & conversions (Google Ads)",
                description: "Utilisés pour mesurer l’efficacité des campagnes et adapter les annonces à vos besoins.",
                linkedCategory: "marketing"
              }
            ]
          }
        }
      }
    },
    onConsent: function () {
      applyConsent();
    },
    onChange: function () {
      applyConsent();
    }
  });
}

// 1) Premier chargement classique
window.addEventListener('load', function () {
  initCookieConsent();
});

// 2) Navigations Turbo (Rails)
document.addEventListener('turbo:load', function () {
  initCookieConsent();
});
