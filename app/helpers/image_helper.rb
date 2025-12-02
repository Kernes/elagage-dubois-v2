module ImageHelper
  # Mapping des URLs Unsplash vers les fichiers locaux optimisés
  UNSPLASH_TO_LOCAL = {
    "photo-1516214104703-d870798883c5" => "unsplash-1516214104703",
    "photo-1473448912268-2022ce9509d8" => "unsplash-1473448912268",
    "photo-1441974231531-c6227db76b6e" => "unsplash-1441974231531",
    "photo-1625246333195-78d9c38ad449" => "unsplash-1625246333195",
    "photo-1416879595882-3373a0480b5b" => "unsplash-1416879595882",
    "photo-1466692476868-aef1dfb1e735" => "unsplash-1466692476868",
    "photo-1500382017468-9049fed747ef" => "unsplash-1500382017468"
  }.freeze

  # Génère un srcset pour une image Unsplash (utilise maintenant les images locales optimisées)
  # Retourne un hash avec :src, :srcset, :sizes, :avif_srcset, :webp_srcset
  def unsplash_srcset(url, sizes_config = { mobile: 400, tablet: 800, desktop: 1200 })
    return { src: url, srcset: "", sizes: "" } unless url&.include?('unsplash.com')
    
    # Extraire l'ID de la photo Unsplash
    photo_id = url.match(/photo-([0-9]+-[a-z0-9]+)/)&.captures&.first
    local_name = photo_id ? UNSPLASH_TO_LOCAL["photo-#{photo_id}"] : nil
    
    # Si on a une image locale optimisée, l'utiliser
    if local_name
      mobile_width = sizes_config[:mobile] || 400
      tablet_width = sizes_config[:tablet] || 800
      desktop_width = sizes_config[:desktop] || 1200
      
      base_path = "/images/optimized/#{local_name}"
      
      # Générer les srcset pour AVIF, WebP et JPG
      avif_srcset = "#{base_path}-mobile.avif #{mobile_width}w, #{base_path}-tablet.avif #{tablet_width}w, #{base_path}-desktop.avif #{desktop_width}w"
      webp_srcset = "#{base_path}-mobile.webp #{mobile_width}w, #{base_path}-tablet.webp #{tablet_width}w, #{base_path}-desktop.webp #{desktop_width}w"
      jpg_srcset = "#{base_path}-mobile.jpg #{mobile_width}w, #{base_path}-tablet.jpg #{tablet_width}w, #{base_path}-desktop.jpg #{desktop_width}w"
      
      # Générer l'attribut sizes
      sizes_attr = if sizes_config[:mobile] && sizes_config[:tablet] && sizes_config[:desktop]
        "(max-width: 640px) #{sizes_config[:mobile]}px, (max-width: 1024px) #{sizes_config[:tablet]}px, #{sizes_config[:desktop]}px"
      else
        sizes_config.values.join(", ")
      end
      
      return {
        src: "#{base_path}-mobile.webp",
        srcset: webp_srcset,
        sizes: sizes_attr,
        avif_srcset: avif_srcset,
        webp_srcset: webp_srcset,
        jpg_srcset: jpg_srcset,
        use_picture: true
      }
    end
    
    # Fallback vers Unsplash si l'image n'est pas localisée
    base_url = url.split('?').first
    params = url.include?('?') ? url.split('?').last.split('&').reject { |p| p.start_with?('w=') } : []
    
    srcset_parts = []
    sizes_config.each do |device, width|
      params_str = params.any? ? "&#{params.join('&')}" : ""
      srcset_parts << "#{base_url}?w=#{width}#{params_str} #{width}w"
    end
    
    default_width = sizes_config[:mobile] || 400
    default_params = params.any? ? "&#{params.join('&')}" : ""
    default_src = "#{base_url}?w=#{default_width}#{default_params}"
    
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
  
  # Génère une balise <picture> optimisée avec AVIF/WebP pour les images Unsplash
  def optimized_unsplash_image(url, alt_text, sizes_config = { mobile: 400, tablet: 800, desktop: 1200 }, css_classes = "", loading = "lazy", extra_attrs = {})
    srcset_data = unsplash_srcset(url, sizes_config)
    
    if srcset_data[:use_picture]
      content_tag(:picture) do
        concat content_tag(:source, nil, {
          srcset: srcset_data[:avif_srcset],
          sizes: srcset_data[:sizes],
          type: "image/avif"
        })
        concat content_tag(:source, nil, {
          srcset: srcset_data[:webp_srcset],
          sizes: srcset_data[:sizes],
          type: "image/webp"
        })
        concat content_tag(:img, nil, {
          src: srcset_data[:src],
          srcset: srcset_data[:webp_srcset],
          sizes: srcset_data[:sizes],
          alt: alt_text,
          class: css_classes,
          loading: loading
        }.merge(extra_attrs))
      end
    else
      content_tag(:img, nil, {
        src: srcset_data[:src],
        srcset: srcset_data[:srcset],
        sizes: srcset_data[:sizes],
        alt: alt_text,
        class: css_classes,
        loading: loading
      }.merge(extra_attrs))
    end
  end
end
