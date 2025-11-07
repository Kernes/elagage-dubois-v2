module ImageHelper
  # Génère une image responsive avec srcset pour Unsplash
  def responsive_image(base_url, alt_text, sizes = "(max-width: 640px) 400px, (max-width: 1024px) 800px, 1200px", css_classes = "", loading = "lazy")
    # Extraire l'ID de l'image Unsplash
    image_id = base_url.match(/photo-([a-zA-Z0-9-]+)/)[1]
    
    # Générer les différentes tailles
    sizes_array = sizes.scan(/(\d+)px/).flatten.map(&:to_i)
    
    # Créer le srcset
    srcset = sizes_array.map do |size|
      "#{base_url.gsub(/w=\d+/, "w=#{size}")} #{size}w"
    end.join(",\n                       ")
    
    # Image par défaut (plus petite taille)
    default_src = base_url.gsub(/w=\d+/, "w=#{sizes_array.first}")
    
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
