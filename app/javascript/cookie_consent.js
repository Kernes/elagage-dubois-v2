
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

  // Applique le consent courant (appelé à chaque load + à chaque changement)
  function applyConsent() {
    try {
      // Catégories gérées dans CookieConsent.run -> categories: { analytics, marketing }
      if (CookieConsent.acceptedCategory('analytics')) {
        loadGtagAds();
      }
      if (CookieConsent.acceptedCategory('marketing')) {
        loadGTM();
      }

      // Event pour GTM si tu veux l'exploiter dans des triggers
      window.dataLayer = window.dataLayer || [];
      window.dataLayer.push({
        event: 'cookie_consent_update',
        analytics: CookieConsent.acceptedCategory('analytics'),
        marketing: CookieConsent.acceptedCategory('marketing')
      });
    } catch (e) {
      console.warn('Erreur applyConsent', e);
    }
  }

  window.addEventListener('load', function () {
    CookieConsent.run({
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
                  description: "Indispensables au bon fonctionnement du site (sécurité, choix de langue, formulaire, etc.).",
                  linkedCategory: "necessary"
                },
                {
                  title: "Mesure d’audience (Google Analytics / Ads)",
                  description: "Nous permet de mesurer la fréquentation du site et de mieux comprendre les pages à améliorer.",
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

      // Appelé quand le consentement est exprimé (première fois ou déjà stocké)
      onConsent: function () {
        applyConsent();
      },

      // Appelé à chaque changement dans le bandeau
      onChange: function () {
        applyConsent();
      }
    });
  });
