module SeoHelper
  # Configuration SEO par défaut
  DEFAULT_SEO = {
    site_name:        "Élagage Dubois",
    site_description: "Expert en élagage et abattage d'arbres autour de Méry-sur-Oise (Val d'Oise - 95). Élagage sécurisé, abattage professionnel, dessouchage mécanique. Devis gratuit sous 24h, intervention rapide.",
    site_keywords:    "élagage Méry-sur-Oise, élagueur Val d'Oise, abattage arbres 95, dessouchage Méry-sur-Oise, entretien jardin 95",
    site_url:         "https://dubois-services-elagage.fr",
    contact_phone:    "+33783892384",
    contact_email:    "jpdubois.services@gmail.com",
    business_address: {
      street:      "30 Route de Pontoise",
      city:        "Méry-sur-Oise",
      postal_code: "95540",
      country:     "FR",
      latitude:    "49.059594",
      longitude:   "2.1655372"
    }
  }.freeze

  # Configuration SEO par page
  PAGE_SEO = {
    home: {
      title:       "Élagage & Abattage autour de Méry-sur-Oise (95) | Élagage Dubois",
      description: "Élagage et abattage d'arbres autour de Méry-sur-Oise (Val d'Oise - 95). Élagage sécurisé, abattage professionnel, dessouchage mécanique et entretien de jardin. Devis gratuit sous 24h.",
      keywords:    "élagage Méry-sur-Oise, élagueur 95, abattage arbres Val d'Oise, dessouchage 95, entretien jardin Méry-sur-Oise",
      priority:    1.0,
      changefreq:  "weekly"
    },
    about: {
      title:       "Qui sommes-nous ? - Élagage Dubois | Élagueur autour de Méry-sur-Oise",
      description: "Découvrez Élagage Dubois, élagueur professionnel basé à Méry-sur-Oise (95). Interventions sécurisées en élagage, abattage et dessouchage autour du Val d'Oise et des départements voisins.",
      keywords:    "qui sommes-nous, Élagage Dubois, élagueur Méry-sur-Oise, élagueur Val d'Oise",
      priority:    0.8,
      changefreq:  "monthly"
    },
    elagage: {
      title:       "Élagage d'Arbres autour de Méry-sur-Oise (95) | Élagage Professionnel",
      description: "Élagage d'arbres professionnel autour de Méry-sur-Oise et dans le Val d'Oise (95). Taille raisonnée, taille sanitaire, élagage sécurisé. Devis gratuit.",
      keywords:    "élagage Méry-sur-Oise, élagage Val d'Oise, élagueur 95, taille arbres 95",
      priority:    0.9,
      changefreq:  "monthly"
    },
    abattage: {
      title:       "Abattage d'Arbres autour de Méry-sur-Oise (95) | Abattage Sécurisé",
      description: "Abattage d'arbres sécurisé autour de Méry-sur-Oise (95). Abattage dirigé, démontage contrôlé, démontage avec rétention. Intervention professionnelle.",
      keywords:    "abattage Méry-sur-Oise, abattage Val d'Oise, abattage sécurisé 95, démontage arbres",
      priority:    0.9,
      changefreq:  "monthly"
    },
    dessouchage: {
      title:       "Dessouchage d'Arbres autour de Méry-sur-Oise (95) | Dessouchage Mécanique",
      description: "Dessouchage mécanique et rognage de souches autour de Méry-sur-Oise (95). Élimination complète des souches après abattage. Devis gratuit.",
      keywords:    "dessouchage Méry-sur-Oise, dessouchage Val d'Oise, rognage souche 95",
      priority:    0.9,
      changefreq:  "monthly"
    },
    entretien: {
      title:       "Entretien de Jardin autour de Méry-sur-Oise (95) | Taille de Haies & Tonte",
      description: "Entretien de jardin autour de Méry-sur-Oise (95) : taille de haies, tonte de pelouse, débroussaillage, entretien d'espaces verts. Devis gratuit.",
      keywords:    "entretien jardin Méry-sur-Oise, taille haies 95, tonte pelouse Val d'Oise",
      priority:    0.9,
      changefreq:  "monthly"
    },
    quote: {
      title:       "Devis Gratuit Élagage & Abattage autour de Méry-sur-Oise (95) | Élagage Dubois",
      description: "Demandez un devis gratuit pour vos travaux d'élagage, d'abattage ou de dessouchage autour de Méry-sur-Oise (95). Réponse rapide.",
      keywords:    "devis élagage Méry-sur-Oise, devis abattage 95, devis dessouchage Val d'Oise",
      priority:    0.8,
      changefreq:  "monthly"
    },
    legal_notices: {
      title:       "Mentions légales - Élagage Dubois",
      description: "Mentions légales du site Élagage Dubois, élagueur basé à Méry-sur-Oise (Val d'Oise - 95).",
      keywords:    "mentions légales, Élagage Dubois",
      priority:    0.3,
      changefreq:  "yearly"
    },
    terms_of_service: {
      title:       "Conditions générales d'utilisation - Élagage Dubois",
      description: "Conditions générales d'utilisation du site Élagage Dubois, spécialiste de l'élagage et de l'abattage d'arbres.",
      keywords:    "CGU, conditions générales, Élagage Dubois",
      priority:    0.3,
      changefreq:  "yearly"
    },
    privacy_policy: {
      title:       "Politique de confidentialité - Élagage Dubois",
      description: "Politique de confidentialité Élagage Dubois - gestion et protection des données personnelles.",
      keywords:    "politique de confidentialité, données personnelles, RGPD",
      priority:    0.3,
      changefreq:  "yearly"
    },
    cookie_policy: {
      title:       "Politique des cookies - Élagage Dubois",
      description: "Politique des cookies Élagage Dubois - informations sur l'utilisation des cookies.",
      keywords:    "politique cookies, cookies",
      priority:    0.3,
      changefreq:  "yearly"
    }
  }.freeze

  LEGAL_PAGES = %i[
    legal_notices
    terms_of_service
    privacy_policy
    cookie_policy
  ].freeze

  # --- Helpers communs pour meta ---

  def current_page_key
    controller_name == "pages" ? action_name.to_sym : nil
  end

  def page_seo_field(field, page_key = current_page_key)
    return content_for(field) if content_for?(field)

    if page_key && PAGE_SEO[page_key] && PAGE_SEO[page_key][field]
      PAGE_SEO[page_key][field]
    else
      case field
      when :title        then DEFAULT_SEO[:site_name]
      when :description  then DEFAULT_SEO[:site_description]
      when :keywords     then DEFAULT_SEO[:site_keywords]
      end
    end
  end

  # Méta classiques

  def meta_title(page_key = current_page_key)
    page_seo_field(:title, page_key)
  end

  def meta_description(page_key = current_page_key)
    page_seo_field(:description, page_key)
  end

  def meta_keywords(page_key = current_page_key)
    page_seo_field(:keywords, page_key)
  end

  def seo_og_title(page_key = current_page_key)
    content_for?(:og_title) ? content_for(:og_title) : meta_title(page_key)
  end

  def seo_og_description(page_key = current_page_key)
    content_for?(:og_description) ? content_for(:og_description) : meta_description(page_key)
  end

  def seo_og_image
    return content_for(:og_image) if content_for?(:og_image)

    # Garde ton image actuelle, juste hostée sur le bon domaine
    "#{DEFAULT_SEO[:site_url]}/images/seo/Screenshot_20251203_094150_Gallery.jpg"
  end

  def seo_canonical_url
    return content_for(:canonical_url) if content_for?(:canonical_url)

    uri = URI.parse(request.url)
    uri.query   = nil
    uri.fragment = nil
    uri.to_s
  end

  def meta_author
    DEFAULT_SEO[:site_name]
  end

  def meta_robots
    if LEGAL_PAGES.include?(current_page_key)
      "noindex, follow"
    else
      "index, follow"
    end
  end

  def meta_googlebot
    meta_robots
  end

  # Open Graph

  def og_type
    "website"
  end

  def og_url
    seo_canonical_url
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

  # --- Données structurées JSON-LD ---

  def structured_data_business
    {
      "@context": "https://schema.org",
      "@type": ["LocalBusiness", "TreeService"],
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
        "addressCountry": DEFAULT_SEO[:business_address][:country],
        "addressRegion": "Île-de-France"
      },
      "geo": {
        "@type": "GeoCoordinates",
        "latitude": DEFAULT_SEO[:business_address][:latitude],
        "longitude": DEFAULT_SEO[:business_address][:longitude]
      },
      "openingHours": "Mo-Sa 08:00-18:00",
      "priceRange": "€€",
      # Rayon autour de Méry-sur-Oise (~45 km)
      "serviceArea": {
        "@type": "GeoCircle",
        "geoMidpoint": {
          "@type": "GeoCoordinates",
          "latitude": DEFAULT_SEO[:business_address][:latitude],
          "longitude": DEFAULT_SEO[:business_address][:longitude]
        },
        "geoRadius": "45000"
      },
      "areaServed": [
        { "@type": "AdministrativeArea", "name": "Val-d'Oise" },
        { "@type": "AdministrativeArea", "name": "Oise" },
        { "@type": "AdministrativeArea", "name": "Yvelines" }
      ],
      "hasOfferCatalog": {
        "@type": "OfferCatalog",
        "name": "Services d'élagage et d'abattage autour de Méry-sur-Oise et dans le Val d'Oise (95)",
        "itemListElement": [
          {
            "@type": "Offer",
            "itemOffered": {
              "@type": "Service",
              "name": "Élagage d'arbres",
              "description": "Élagage d'arbres professionnel : taille raisonnée, taille sanitaire et élagage de sécurité autour de Méry-sur-Oise et dans le Val d'Oise."
            },
            "areaServed": { "@type": "AdministrativeArea", "name": "Val-d'Oise" }
          },
          {
            "@type": "Offer",
            "itemOffered": {
              "@type": "Service",
              "name": "Abattage d'arbres",
              "description": "Abattage d'arbres sécurisé : abattage dirigé, démontage contrôlé, démontage avec rétention."
            },
            "areaServed": { "@type": "AdministrativeArea", "name": "Val-d'Oise" }
          },
          {
            "@type": "Offer",
            "itemOffered": {
              "@type": "Service",
              "name": "Dessouchage",
              "description": "Dessouchage mécanique et rognage de souches après abattage."
            },
            "areaServed": { "@type": "AdministrativeArea", "name": "Val-d'Oise" }
          },
          {
            "@type": "Service",
            "name": "Entretien de jardin",
            "description": "Entretien de jardin : taille de haies, tonte de pelouse, débroussaillage autour de Méry-sur-Oise."
          }
        ]
      },
      "sameAs": [
        "https://www.facebook.com/elagage.dubois",
        "https://www.linkedin.com/company/elagage-dubois"
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
      "description": DEFAULT_SEO[:site_description]
      # Pas de SearchAction car pas de vraie recherche interne
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
          { "@type": "AdministrativeArea", "name": "Val-d'Oise" },
          { "@type": "AdministrativeArea", "name": "Oise" },
          { "@type": "AdministrativeArea", "name": "Yvelines" }
        ]
      },
      "areaServed": [
        { "@type": "AdministrativeArea", "name": "Val-d'Oise" },
        { "@type": "AdministrativeArea", "name": "Oise" },
        { "@type": "AdministrativeArea", "name": "Yvelines" }
      ],
      "availableChannel": {
        "@type": "ServiceChannel",
        "serviceUrl": "#{DEFAULT_SEO[:site_url]}/devis",
        "servicePhone": DEFAULT_SEO[:contact_phone]
      }
    }
  end
end
