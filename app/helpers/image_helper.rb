module ImageHelper
  # Génère un srcset pour une image Unsplash
  # Retourne un hash avec :src, :srcset, :sizes
  def unsplash_srcset(url, sizes_config = { mobile: 400, tablet: 800, desktop: 1200 })
    return { src: url, srcset: "", sizes: "" } unless url&.include?('unsplash.com')
    
    # Nettoyer l'URL pour enlever les paramètres existants
    base_url = url.split('?').first
    
    # Extraire les paramètres existants (sauf w=)
    params = url.include?('?') ? url.split('?').last.split('&').reject { |p| p.start_with?('w=') } : []
    
    # Générer le srcset
    srcset_parts = []
    sizes_config.each do |device, width|
      params_str = params.any? ? "&#{params.join('&')}" : ""
      srcset_parts << "#{base_url}?w=#{width}#{params_str} #{width}w"
    end
    
    # Image par défaut (mobile)
    default_width = sizes_config[:mobile] || 400
    default_params = params.any? ? "&#{params.join('&')}" : ""
    default_src = "#{base_url}?w=#{default_width}#{default_params}"
    
    # Générer l'attribut sizes
    sizes_attr = if sizes_config[:mobile] && sizes_config[:tablet] && sizes_config[:desktop]
      "(max-width: 640px) #{sizes_config[:mobile]}px, (max-width: 1024px) #{sizes_config[:tablet]}px, #{sizes_config[:desktop]}px"
    else
      sizes_config.values.join(", ")
    end
    
    {
      src: default_src,
      srcset: srcset_parts.join(", "),
      sizes: sizes_attr
    }
  end
  
  # Génère une image responsive avec srcset pour Unsplash
  def responsive_image(base_url, alt_text, sizes = "(max-width: 640px) 400px, (max-width: 1024px) 800px, 1200px", css_classes = "", loading = "lazy")
    # Extraire les paramètres existants
    if base_url.include?('?')
      url_parts = base_url.split('?')
      base = url_parts[0]
      params = url_parts[1].split('&').reject { |p| p.start_with?('w=') }
    else
      base = base_url
      params = []
    end
    
    # Générer les différentes tailles
    sizes_array = sizes.scan(/(\d+)px/).flatten.map(&:to_i)
    
    # Créer le srcset
    srcset = sizes_array.map do |size|
      params_str = params.any? ? "&#{params.join('&')}" : ""
      "#{base}?w=#{size}#{params_str} #{size}w"
    end.join(", ")
    
    # Image par défaut (plus petite taille)
    default_params = params.any? ? "&#{params.join('&')}" : ""
    default_src = "#{base}?w=#{sizes_array.first}#{default_params}"
    
    content_tag(:img, nil, {
      src: default_src,
      srcset: srcset,
      sizes: sizes,
      alt: alt_text,
      class: css_classes,
      loading: loading
    })
  end
  
  # Génère une image responsive pour les avatars
  def responsive_avatar(base_url, alt_text, css_classes = "bg-gray-50 rounded-full size-12", loading = "lazy")
    responsive_image(base_url, alt_text, "(max-width: 640px) 100px, 150px", css_classes, loading)
  end
  
  # Génère une image responsive pour les cartes
  def responsive_card_image(base_url, alt_text, css_classes = "object-cover w-full bg-gray-100 rounded-2xl aspect-video sm:aspect-2/1 lg:aspect-3/2", loading = "lazy")
    responsive_image(base_url, alt_text, "(max-width: 640px) 400px, (max-width: 1024px) 800px, 1200px", css_classes, loading)
  end
  
  # Génère une image responsive pour le header
  def responsive_header_image(base_url, alt_text, css_classes = "object-cover mt-10 w-full max-w-lg rounded-2xl aspect-6/5 outline-1 -outline-offset-1 outline-white/10 sm:mt-16 lg:mt-0 lg:max-w-none xl:row-span-2 xl:row-end-2 xl:mt-36", loading = "lazy")
    responsive_image(base_url, alt_text, "(max-width: 640px) 400px, (max-width: 1024px) 800px, 1200px", css_classes, loading)
  end
end
