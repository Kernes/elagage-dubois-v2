module SeoHelper
  # Configuration SEO par défaut
  DEFAULT_SEO = {
    site_name: "Élagage Dubois",
    site_description: "Expert en élagage, abattage et dessouchage. Services professionnels pour l'entretien et la gestion de vos arbres. Devis gratuit, intervention rapide.",
    site_keywords: "élagage, abattage, dessouchage, entretien arbres, professionnel, expert, taille arbres, Île-de-France, Élagage Dubois",
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
      title: "Élagage Dubois - Expert en élagage, abattage et dessouchage | Professionnel des arbres",
      description: "Expert en élagage, abattage et dessouchage. Services professionnels pour l'entretien et la gestion de vos arbres. Devis gratuit, intervention rapide.",
      keywords: "élagage, abattage, dessouchage, entretien arbres, professionnel, expert, taille arbres, Île-de-France, Élagage Dubois",
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
      title: "Élagage et Étêtage d'Arbres - Élagage Dubois | Expert Professionnel",
      description: "Service d'élagage et d'étêtage d'arbres professionnel en Île-de-France. Expertise, sécurité et respect de l'environnement. Devis gratuit, intervention rapide.",
      keywords: "élagage, étêtage, taille arbres, élagage professionnel, taille formation, réduction couronne, Île-de-France, Élagage Dubois",
      priority: 0.9,
      changefreq: "monthly"
    },
    abattage: {
      title: "Abattage d'Arbres de Toutes Espèces - Élagage Dubois | Expert Professionnel",
      description: "Service d'abattage d'arbres professionnel en Île-de-France. Abattage dirigé, sécurisé et respectueux de l'environnement. Devis gratuit, intervention rapide.",
      keywords: "abattage arbres, abattage dirigé, abattage sécurisé, abattage professionnel, démontage contrôlé, démontage avec rétention, Île-de-France, Élagage Dubois",
      priority: 0.9,
      changefreq: "monthly"
    },
    dessouchage: {
      title: "Dessouchage d'Arbres - Élagage Dubois | Expert Professionnel",
      description: "Service de dessouchage d'arbres professionnel en Île-de-France. Dessouchage mécanique, rognage ou grignotage, élimination complète des souches. Devis gratuit, intervention rapide.",
      keywords: "dessouchage, dessouchage arbre, dessouchage mécanique, rognage, grignotage, élimination souche, Île-de-France, Élagage Dubois",
      priority: 0.9,
      changefreq: "monthly"
    },
    entretien: {
      title: "Entretien de Jardin et Espaces Verts - Élagage Dubois | Services Complets",
      description: "Services d'entretien de jardin et espaces verts en Île-de-France. Taille de haies, tonte de pelouse, débroussaillage, traitement d'arbres. Devis gratuit, intervention rapide.",
      keywords: "entretien jardin, taille haies, tonte pelouse, débroussaillage, traitement arbres, création pelouse, entretien espaces verts, Île-de-France, Élagage Dubois",
      priority: 0.9,
      changefreq: "monthly"
    },
    quote: {
      title: "Devis gratuit - Élagage Dubois | Expert en élagage, abattage et dessouchage",
      description: "Demandez votre devis gratuit pour vos travaux d'élagage, d'abattage ou de dessouchage. Réponse rapide sous 24h. Contactez-nous !",
      keywords: "devis gratuit, élagage, abattage, dessouchage, devis, contact, Élagage Dubois, Île-de-France",
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
        "areaServed": {
          "@type": "State",
          "name": "Île-de-France"
        }
      },
      "areaServed": {
        "@type": "State",
        "name": "Île-de-France"
      },
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
