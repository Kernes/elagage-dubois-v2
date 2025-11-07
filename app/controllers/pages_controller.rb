class PagesController < ApplicationController
  def home
  end

  def about
  end

  def elagage
  end

  def abattage
  end

  def dessouchage
  end

  def entretien
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
        url: elagage_path, 
        priority: 0.9, 
        changefreq: "monthly",
        lastmod: Date.current.strftime('%Y-%m-%d')
      },
      { 
        url: abattage_path, 
        priority: 0.9, 
        changefreq: "monthly",
        lastmod: Date.current.strftime('%Y-%m-%d')
      },
      { 
        url: dessouchage_path, 
        priority: 0.9, 
        changefreq: "monthly",
        lastmod: Date.current.strftime('%Y-%m-%d')
      },
      { 
        url: entretien_path, 
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
