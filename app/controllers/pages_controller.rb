class PagesController < ApplicationController
  def home
  end

  def about
  end

  def service_residentiel
  end

  def service_tertiaire
  end

  def service_chiffrage
  end

  def recruitment
  end

  def legal_notices
  end

  def terms_of_service
  end

  def privacy_policy
  end

  def cookie_policy
  end

  def sitemap
    @pages = [
      { 
        url: root_path, 
        priority: 1.0, 
        changefreq: "weekly",
        lastmod: Date.current.strftime('%Y-%m-%d')
      },
      { 
        url: about_path, 
        priority: 0.8, 
        changefreq: "monthly",
        lastmod: Date.current.strftime('%Y-%m-%d')
      },
      { 
        url: service_residentiel_path, 
        priority: 0.9, 
        changefreq: "monthly",
        lastmod: Date.current.strftime('%Y-%m-%d')
      },
      { 
        url: service_tertiaire_path, 
        priority: 0.9, 
        changefreq: "monthly",
        lastmod: Date.current.strftime('%Y-%m-%d')
      },
      { 
        url: service_chiffrage_path, 
        priority: 0.9, 
        changefreq: "monthly",
        lastmod: Date.current.strftime('%Y-%m-%d')
      },
      { 
        url: quote_path, 
        priority: 0.8, 
        changefreq: "monthly",
        lastmod: Date.current.strftime('%Y-%m-%d')
      },
      { 
        url: recruitment_path, 
        priority: 0.6, 
        changefreq: "monthly",
        lastmod: Date.current.strftime('%Y-%m-%d')
      },
      { 
        url: legal_notices_path, 
        priority: 0.3, 
        changefreq: "yearly",
        lastmod: Date.current.strftime('%Y-%m-%d')
      },
      { 
        url: terms_of_service_path, 
        priority: 0.3, 
        changefreq: "yearly",
        lastmod: Date.current.strftime('%Y-%m-%d')
      },
      { 
        url: privacy_policy_path, 
        priority: 0.3, 
        changefreq: "yearly",
        lastmod: Date.current.strftime('%Y-%m-%d')
      },
      { 
        url: cookie_policy_path, 
        priority: 0.3, 
        changefreq: "yearly",
        lastmod: Date.current.strftime('%Y-%m-%d')
      }
    ]
    render layout: false
  end
end
