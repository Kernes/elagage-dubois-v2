// Gestion du consentement des cookies avec CookieConsent
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

    // ======================
    // Catégories de cookies
    // ======================
    categories: {
      necessary: {
        enabled: true,
        readOnly: true
      },
      analytics: {
        enabled: true,         // ACTIVÉ PAR DÉFAUT
      },
      marketing: {
        enabled: true          // ACTIVÉ PAR DÉFAUT
      }
    },

    // ======================
    // Langue & textes
    // ======================
    language: {
      default: "fr",
      translations: {
        fr: {
          consentModal: {
            title: "Votre confidentialité compte",
            description:
              "Nous utilisons des cookies pour améliorer l'expérience utilisateur, mesurer l'audience, et diffuser des publicités pertinentes grâce à Google Ads. Vous pouvez accepter, refuser ou personnaliser vos choix.",
            acceptAllBtn: "Tout accepter",
            acceptNecessaryBtn: "Tout refuser",
            showPreferencesBtn: "Personnaliser"
          },

          preferencesModal: {
            title: "Préférences de confidentialité",
            acceptAllBtn: "Tout accepter",
            acceptNecessaryBtn: "Tout refuser",
            savePreferencesBtn: "Enregistrer mes choix",

            sections: [
              {
                title: "Cookies strictement nécessaires",
                description:
                  "Ces cookies permettent le bon fonctionnement du site (sécurité, formulaire, conservation de vos choix). Ils ne peuvent pas être désactivés.",
                linkedCategory: "necessary"
              },
              {
                title: "Mesure d'audience",
                description:
                  "Ces cookies nous permettent d'analyser la performance du site afin d'améliorer l'expérience utilisateur. (Ex : Google Analytics).",
                linkedCategory: "analytics"
              },
              {
                title: "Publicité & conversions",
                description:
                  "Ces cookies permettent de mesurer les conversions et d'améliorer le ciblage de nos campagnes Google Ads. Aucun suivi intrusif n'est effectué.",
                linkedCategory: "marketing"
              }
            ]
          }
        }
      }
    },

    // ======================
    // Callback : on push vers GTM
    // ======================
    onConsent: ({ cookie }) => {
      window.dataLayer = window.dataLayer || [];
      window.dataLayer.push({
        event: "cookie_consent_update",
        consent: cookie.categories
      });
    }
  });
});

