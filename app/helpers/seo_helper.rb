module SeoHelper
  # Configuration SEO par défaut
  DEFAULT_SEO = {
    site_name: "Élagage Dubois",
    site_description: "Expert en élagage et abattage d'arbres dans le Val d'Oise (95). Élagage sécurisé, abattage professionnel, dessouchage mécanique. Devis gratuit sous 24h, intervention rapide 7j/7.",
    site_keywords: "élagage Val d'Oise, abattage Val d'Oise, élagage 95, abattage 95, élagage professionnel Val d'Oise, abattage sécurisé 95, dessouchage Val d'Oise, taille arbres 95, élagueur Val d'Oise, professionnel élagage 95",
    site_url: "https://elagage-dubois-v2.scalingo.io",
    contact_phone: "+33783892384",
    contact_email: "jpdubois.services@gmail.com",
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
      title: "Élagage & Abattage Val d'Oise 95 | Élagage Dubois - Expert Professionnel",
      description: "Expert en élagage et abattage d'arbres dans le Val d'Oise (95). Élagage sécurisé, abattage professionnel, dessouchage mécanique. Devis gratuit sous 24h, intervention rapide 7j/7.",
      keywords: "élagage Val d'Oise, abattage Val d'Oise, élagage 95, abattage 95, élagage professionnel Val d'Oise, abattage sécurisé 95, dessouchage Val d'Oise, élagueur Val d'Oise, taille arbres 95, élagage Guyancourt, abattage Cergy, élagage Versailles",
      priority: 1.0,
      changefreq: "weekly"
    },
    about: {
      title: "Qui sommes-nous ? - Élagage Dubois | Expert en élagage et abattage",
      description: "Découvrez Élagage Dubois, votre partenaire de confiance pour l'élagage, l'abattage et le dessouchage en Île-de-France. Expertise professionnelle, sécurité et respect de l'environnement garantis.",
      keywords: "qui sommes-nous, Élagage Dubois, équipe, expertise, élagage, professionnel, Île-de-France",
      priority: 0.8,
      changefreq: "monthly"
    },
    elagage: {
      title: "Élagage d'Arbres Val d'Oise 95 | Élagage Professionnel & Sécurisé",
      description: "Élagage d'arbres professionnel dans le Val d'Oise (95). Élagage sécurisé, taille sanitaire, taille raisonnée. Expert certifié, intervention rapide. Devis gratuit.",
      keywords: "élagage Val d'Oise, élagage 95, élagage professionnel Val d'Oise, élagage sécurisé 95, taille arbres Val d'Oise, étêtage Val d'Oise, élagueur Val d'Oise, élagage Guyancourt, élagage Versailles, élagage Cergy, élagage Pontoise, taille formation 95",
      priority: 0.9,
      changefreq: "monthly"
    },
    abattage: {
      title: "Abattage d'Arbres Val d'Oise 95 | Abattage Sécurisé & Professionnel",
      description: "Abattage d'arbres professionnel dans le Val d'Oise (95). Abattage dirigé, démontage contrôlé, démontage avec rétention. Expert certifié, sécurité garantie. Devis gratuit. Guyancourt, Versailles, Cergy.",
      keywords: "abattage Val d'Oise, abattage 95, abattage sécurisé Val d'Oise, abattage dirigé 95, démontage contrôlé Val d'Oise, abattage professionnel 95, abattage arbres Val d'Oise, abattage Guyancourt, abattage Versailles, abattage Cergy, démontage avec rétention 95",
      priority: 0.9,
      changefreq: "monthly"
    },
    dessouchage: {
      title: "Dessouchage d'Arbres Val d'Oise 95 | Dessouchage Mécanique Professionnel",
      description: "Dessouchage d'arbres professionnel dans le Val d'Oise (95). Dessouchage mécanique, rognage, grignotage. Élimination complète des souches. Devis gratuit. Guyancourt, Versailles, Cergy.",
      keywords: "dessouchage Val d'Oise, dessouchage 95, dessouchage mécanique Val d'Oise, rognage Val d'Oise, grignotage 95, élimination souche Val d'Oise, dessouchage professionnel 95, dessouchage Guyancourt, dessouchage Versailles",
      priority: 0.9,
      changefreq: "monthly"
    },
    entretien: {
      title: "Entretien Jardin Val d'Oise 95 | Taille Haies, Tonte Pelouse, Débroussaillage",
      description: "Entretien de jardin professionnel dans le Val d'Oise (95). Taille de haies, tonte de pelouse, débroussaillage, traitement d'arbres. Devis gratuit. Guyancourt, Versailles, Cergy.",
      keywords: "entretien jardin Val d'Oise, taille haies 95, tonte pelouse Val d'Oise, débroussaillage 95, traitement arbres Val d'Oise, entretien espaces verts 95, jardinier Val d'Oise, entretien jardin Guyancourt",
      priority: 0.9,
      changefreq: "monthly"
    },
    quote: {
      title: "Devis Gratuit Élagage & Abattage Val d'Oise 95 | Élagage Dubois",
      description: "Devis gratuit élagage et abattage dans le Val d'Oise (95). Réponse sous 24h. Expert certifié en élagage, abattage sécurisé et dessouchage. Intervention rapide 7j/7.",
      keywords: "devis élagage Val d'Oise, devis abattage 95, devis gratuit élagage, devis abattage Val d'Oise, devis dessouchage 95, devis élagage Guyancourt",
      priority: 0.8,
      changefreq: "monthly"
    },
    recruitment: {
      title: "Recrutement - Élagage Dubois | Rejoignez notre équipe",
      description: "Rejoignez l'équipe Élagage Dubois ! Offres d'emploi pour élagueurs professionnels en Île-de-France. Formation et évolution garanties.",
      keywords: "recrutement, emploi, élagueur, carrière, Élagage Dubois, Île-de-France",
      priority: 0.6,
      changefreq: "monthly"
    },
    legal_notices: {
      title: "Mentions légales - Élagage Dubois",
      description: "Mentions légales de Élagage Dubois - Expert en élagage, abattage et dessouchage dans le Val d'Oise (95).",
      keywords: "mentions légales, Élagage Dubois, informations légales",
      priority: 0.3,
      changefreq: "yearly"
    },
    terms_of_service: {
      title: "Conditions générales d'utilisation - Élagage Dubois",
      description: "Conditions générales d'utilisation des services Élagage Dubois - Expert en élagage et abattage professionnel.",
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
    "#{DEFAULT_SEO[:site_url]}/images/seo/Screenshot_20251203_094150_Gallery.jpg"
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
      "areaServed": {
        "@type": "State",
        "name": "Val d'Oise"
      },
      "hasOfferCatalog": {
        "@type": "OfferCatalog",
        "name": "Services d'élagage et d'entretien d'arbres",
        "itemListElement": [
          {
            "@type": "Offer",
            "itemOffered": {
              "@type": "Service",
              "name": "Élagage",
              "description": "Service d'élagage professionnel : élagage sécurisé, taille sanitaire, taille raisonnée"
            }
          },
          {
            "@type": "Offer",
            "itemOffered": {
              "@type": "Service",
              "name": "Abattage",
              "description": "Service d'abattage d'arbres professionnel : démontage contrôlé, démontage avec rétention"
            }
          },
          {
            "@type": "Offer",
            "itemOffered": {
              "@type": "Service",
              "name": "Dessouchage",
              "description": "Service de dessouchage professionnel : rognage ou grignotage, élimination complète des souches"
            }
          },
          {
            "@type": "Offer",
            "itemOffered": {
              "@type": "Service",
              "name": "Entretien de jardin",
              "description": "Services d'entretien de jardin et espaces verts : taille de haies, tonte de pelouse, débroussaillage"
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
        "target": {
          "@type": "EntryPoint",
          "urlTemplate": "#{DEFAULT_SEO[:site_url]}/devis?q={search_term_string}"
        },
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

  def structured_data_service(service_name, description, service_type = "TreeService")
    {
      "@context": "https://schema.org",
      "@type": service_type,
      "name": service_name,
      "description": description,
      "provider": {
        "@type": "LocalBusiness",
        "name": DEFAULT_SEO[:site_name],
        "telephone": DEFAULT_SEO[:contact_phone],
        "email": DEFAULT_SEO[:contact_email],
        "address": {
          "@type": "PostalAddress",
          "streetAddress": DEFAULT_SEO[:business_address][:street],
          "addressLocality": DEFAULT_SEO[:business_address][:city],
          "postalCode": DEFAULT_SEO[:business_address][:postal_code],
          "addressCountry": DEFAULT_SEO[:business_address][:country]
        },
        "areaServed": [
          {
            "@type": "State",
            "name": "Val d'Oise"
          },
          {
            "@type": "PostalCode",
            "postalCode": "95"
          },
          {
            "@type": "City",
            "name": "Guyancourt"
          },
          {
            "@type": "City",
            "name": "Versailles"
          },
          {
            "@type": "City",
            "name": "Cergy"
          }
        ]
      },
      "areaServed": [
        {
          "@type": "State",
          "name": "Val d'Oise"
        },
        {
          "@type": "PostalCode",
          "postalCode": "95"
        }
      ],
      "availableChannel": {
        "@type": "ServiceChannel",
        "serviceUrl": "#{DEFAULT_SEO[:site_url]}/devis",
        "servicePhone": DEFAULT_SEO[:contact_phone]
      }
    }
  end

  # Méthodes utilitaires
  def current_page_key
    controller_name == 'pages' ? action_name.to_sym : nil
  end
end
