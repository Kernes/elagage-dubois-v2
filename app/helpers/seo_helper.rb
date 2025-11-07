module SeoHelper
  # Configuration SEO par défaut
  DEFAULT_SEO = {
    site_name: "Élagage Dubois",
    site_description: "Service professionnel d'élagage et de taille d'arbres en Île-de-France. Rapide, fiable et conforme.",
    site_keywords: "élagage, arbre, taille, élagage professionnel, entretien arbre, Île-de-France, professionnel, Élagage Dubois",
    site_url: "https://elagage-dubois-v2.scalingo.io",
    contact_phone: "+33620479966",
    contact_email: "sqy.etatdeslieux@gmail.com",
    business_address: {
      street: "4, rue Philibert Delorme",
      city: "Guyancourt",
      postal_code: "78280",
      country: "FR",
      latitude: "48.7734",
      longitude: "2.0734"
    }
  }.freeze

  # Configuration SEO par page
  PAGE_SEO = {
    home: {
      title: "Élagage Dubois - États des lieux professionnels en Île-de-France | Guyancourt",
      description: "Élagage Dubois : service professionnel d'états des lieux en Île-de-France. Entrée, sortie, inventaire. Rapide, fiable et conforme. Contactez Yoan DUBOIS au 06 20 47 99 66.",
      keywords: "état des lieux, Île-de-France, Guyancourt, professionnel, entrée, sortie, inventaire, bailleur, agence immobilière, Élagage Dubois, Yoan DUBOIS",
      priority: 1.0,
      changefreq: "weekly"
    },
    about: {
      title: "Qui sommes-nous ? - Élagage Dubois | État des lieux professionnel",
      description: "Découvrez Élagage Dubois, votre partenaire de confiance pour les états des lieux en Île-de-France. Expertise professionnelle, rapidité et conformité garanties.",
      keywords: "qui sommes-nous, Élagage Dubois, équipe, expertise, état des lieux, professionnel, Île-de-France",
      priority: 0.8,
      changefreq: "monthly"
    },
    service_residentiel: {
      title: "État des lieux résidentiel - Élagage Dubois | Service professionnel",
      description: "État des lieux résidentiel professionnel en Île-de-France. Entrée, sortie, inventaire pour appartements et maisons. Devis gratuit.",
      keywords: "état des lieux résidentiel, appartement, maison, entrée, sortie, inventaire, bailleur, locataire, Île-de-France",
      priority: 0.9,
      changefreq: "monthly"
    },
    service_tertiaire: {
      title: "État des lieux tertiaire - Élagage Dubois | Bureaux et commerces",
      description: "État des lieux tertiaire professionnel en Île-de-France. Bureaux, commerces, locaux professionnels. Service rapide et fiable.",
      keywords: "état des lieux tertiaire, bureau, commerce, local professionnel, bail commercial, Île-de-France",
      priority: 0.9,
      changefreq: "monthly"
    },
    service_chiffrage: {
      title: "Chiffrage locatif - Élagage Dubois | Évaluation immobilière",
      description: "Service de chiffrage locatif professionnel en Île-de-France. Évaluation précise de vos biens immobiliers pour optimiser vos revenus.",
      keywords: "chiffrage locatif, évaluation immobilière, loyer, marché locatif, Île-de-France, expertise",
      priority: 0.9,
      changefreq: "monthly"
    },
    quote: {
      title: "Devis gratuit - Élagage Dubois | État des lieux professionnel",
      description: "Demandez votre devis gratuit pour un état des lieux professionnel en Île-de-France. Réponse rapide sous 24h. Contactez-nous !",
      keywords: "devis gratuit, état des lieux, devis, contact, Élagage Dubois, Île-de-France",
      priority: 0.8,
      changefreq: "monthly"
    },
    recruitment: {
      title: "Recrutement - Élagage Dubois | Rejoignez notre équipe",
      description: "Rejoignez l'équipe Élagage Dubois ! Offres d'emploi pour agents d'états des lieux en Île-de-France. Formation et évolution garanties.",
      keywords: "recrutement, emploi, agent état des lieux, carrière, Élagage Dubois, Île-de-France",
      priority: 0.6,
      changefreq: "monthly"
    },
    legal_notices: {
      title: "Mentions légales - Élagage Dubois",
      description: "Mentions légales de Élagage Dubois - Service d'états des lieux professionnel en Île-de-France.",
      keywords: "mentions légales, Élagage Dubois, informations légales",
      priority: 0.3,
      changefreq: "yearly"
    },
    terms_of_service: {
      title: "Conditions générales d'utilisation - Élagage Dubois",
      description: "Conditions générales d'utilisation des services Élagage Dubois - États des lieux professionnel.",
      keywords: "CGU, conditions générales, utilisation, Élagage Dubois",
      priority: 0.3,
      changefreq: "yearly"
    },
    privacy_policy: {
      title: "Politique de confidentialité - Élagage Dubois",
      description: "Politique de confidentialité Élagage Dubois - Protection des données personnelles.",
      keywords: "politique confidentialité, protection données, RGPD, Élagage Dubois",
      priority: 0.3,
      changefreq: "yearly"
    },
    cookie_policy: {
      title: "Politique des cookies - Élagage Dubois",
      description: "Politique des cookies Élagage Dubois - Utilisation des cookies sur notre site.",
      keywords: "cookies, politique cookies, Élagage Dubois",
      priority: 0.3,
      changefreq: "yearly"
    }
  }.freeze

  # Méthodes pour les balises meta
  def meta_title(page_key = nil)
    return content_for(:title) if content_for?(:title)
    return PAGE_SEO[page_key][:title] if page_key && PAGE_SEO[page_key]
    DEFAULT_SEO[:site_name]
  end

  def meta_description(page_key = nil)
    return content_for(:description) if content_for?(:description)
    return PAGE_SEO[page_key][:description] if page_key && PAGE_SEO[page_key]
    DEFAULT_SEO[:site_description]
  end

  def meta_keywords(page_key = nil)
    return content_for(:keywords) if content_for?(:keywords)
    return PAGE_SEO[page_key][:keywords] if page_key && PAGE_SEO[page_key]
    DEFAULT_SEO[:site_keywords]
  end

  def seo_og_title(page_key = nil)
    return content_for(:og_title) if content_for?(:og_title)
    meta_title(page_key)
  end

  def seo_og_description(page_key = nil)
    return content_for(:og_description) if content_for?(:og_description)
    meta_description(page_key)
  end

  def seo_og_image
    return content_for(:og_image) if content_for?(:og_image)
    "#{DEFAULT_SEO[:site_url]}/icon.png"
  end

  def seo_canonical_url
    return content_for(:canonical_url) if content_for?(:canonical_url)
    request.url
  end

  def meta_author
    DEFAULT_SEO[:site_name]
  end

  def meta_robots
    "index, follow"
  end

  def meta_googlebot
    "index, follow"
  end

  # Open Graph
  def og_type
    "website"
  end

  def og_url
    request.url
  end

  def og_site_name
    DEFAULT_SEO[:site_name]
  end

  def og_locale
    "fr_FR"
  end

  # Twitter Card
  def twitter_card
    "summary_large_image"
  end

  def twitter_site
    "@elagage_dubois"
  end

  def twitter_creator
    "@elagage_dubois"
  end

  # Données structurées JSON-LD
  def structured_data_business
    {
      "@context": "https://schema.org",
      "@type": "LocalBusiness",
      "name": DEFAULT_SEO[:site_name],
      "description": DEFAULT_SEO[:site_description],
      "url": DEFAULT_SEO[:site_url],
      "telephone": DEFAULT_SEO[:contact_phone],
      "email": DEFAULT_SEO[:contact_email],
      "address": {
        "@type": "PostalAddress",
        "streetAddress": DEFAULT_SEO[:business_address][:street],
        "addressLocality": DEFAULT_SEO[:business_address][:city],
        "postalCode": DEFAULT_SEO[:business_address][:postal_code],
        "addressCountry": DEFAULT_SEO[:business_address][:country]
      },
      "geo": {
        "@type": "GeoCoordinates",
        "latitude": DEFAULT_SEO[:business_address][:latitude],
        "longitude": DEFAULT_SEO[:business_address][:longitude]
      },
      "openingHours": "Mo-Sa 08:00-18:00",
      "priceRange": "€€",
      "serviceArea": {
        "@type": "GeoCircle",
        "geoMidpoint": {
          "@type": "GeoCoordinates",
          "latitude": DEFAULT_SEO[:business_address][:latitude],
          "longitude": DEFAULT_SEO[:business_address][:longitude]
        },
        "geoRadius": "50000"
      },
      "hasOfferCatalog": {
        "@type": "OfferCatalog",
        "name": "Services d'états des lieux",
        "itemListElement": [
          {
            "@type": "Offer",
            "itemOffered": {
              "@type": "Service",
              "name": "État des lieux d'entrée",
              "description": "État des lieux d'entrée professionnel pour locaux résidentiels et tertiaires"
            }
          },
          {
            "@type": "Offer",
            "itemOffered": {
              "@type": "Service",
              "name": "État des lieux de sortie",
              "description": "État des lieux de sortie professionnel pour locaux résidentiels et tertiaires"
            }
          },
          {
            "@type": "Offer",
            "itemOffered": {
              "@type": "Service",
              "name": "Inventaire des lieux",
              "description": "Inventaire détaillé des biens et équipements"
            }
          },
          {
            "@type": "Offer",
            "itemOffered": {
              "@type": "Service",
              "name": "Chiffrage locatif",
              "description": "Évaluation et chiffrage locatif de vos biens immobiliers"
            }
          }
        ]
      },
      "sameAs": [
        "https://www.linkedin.com/company/elagage-dubois",
        "https://www.facebook.com/elagage.dubois"
      ]
    }
  end

  def structured_data_organization
    {
      "@context": "https://schema.org",
      "@type": "Organization",
      "name": DEFAULT_SEO[:site_name],
      "url": DEFAULT_SEO[:site_url],
      "logo": "#{DEFAULT_SEO[:site_url]}/icon.png",
      "contactPoint": {
        "@type": "ContactPoint",
        "telephone": DEFAULT_SEO[:contact_phone],
        "contactType": "customer service",
        "areaServed": "FR",
        "availableLanguage": "French"
      },
      "address": {
        "@type": "PostalAddress",
        "streetAddress": DEFAULT_SEO[:business_address][:street],
        "addressLocality": DEFAULT_SEO[:business_address][:city],
        "postalCode": DEFAULT_SEO[:business_address][:postal_code],
        "addressCountry": DEFAULT_SEO[:business_address][:country]
      }
    }
  end

  def structured_data_web_site
    {
      "@context": "https://schema.org",
      "@type": "WebSite",
      "name": DEFAULT_SEO[:site_name],
      "url": DEFAULT_SEO[:site_url],
      "description": DEFAULT_SEO[:site_description],
      "potentialAction": {
        "@type": "SearchAction",
        "target": "#{DEFAULT_SEO[:site_url]}/devis?q={search_term_string}",
        "query-input": "required name=search_term_string"
      }
    }
  end

  def structured_data_breadcrumb(items)
    {
      "@context": "https://schema.org",
      "@type": "BreadcrumbList",
      "itemListElement": items.map.with_index do |item, index|
        {
          "@type": "ListItem",
          "position": index + 1,
          "name": item[:name],
          "item": item[:url]
        }
      end
    }
  end

  def structured_data_faq(faqs)
    {
      "@context": "https://schema.org",
      "@type": "FAQPage",
      "mainEntity": faqs.map do |faq|
        {
          "@type": "Question",
          "name": faq[:question],
          "acceptedAnswer": {
            "@type": "Answer",
            "text": faq[:answer]
          }
        }
      end
    }
  end

  # Méthodes utilitaires
  def current_page_key
    controller_name == 'pages' ? action_name.to_sym : nil
  end
end
