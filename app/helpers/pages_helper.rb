module PagesHelper
  def gallery_realizations(page_key)
    case page_key
    when :elagage
      [
        {
          category: "Élagage d'un chêne centenaire",
          images: [
            { url: "https://images.unsplash.com/photo-1516214104703-d870798883c5?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Élagage professionnel" },
            { url: "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Élagage chêne centenaire" },
            { url: "https://images.unsplash.com/photo-1473448912268-2022ce9509d8?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Élagage chêne centenaire" }
          ]
        },
        {
          category: "Taille de formation",
          images: [
            { url: "https://images.unsplash.com/photo-1500382017468-9049fed747ef?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Taille professionnelle" },
            { url: "https://images.unsplash.com/photo-1516214104703-d870798883c5?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Taille de formation" }
          ]
        },
        {
          category: "Réduction de couronne",
          images: [
            { url: "https://images.unsplash.com/photo-1473448912268-2022ce9509d8?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Réduction de couronne" },
            { url: "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Réduction de couronne" }
          ]
        },
        {
          category: "Étêtage sécurisé",
          images: [
            { url: "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Étêtage sécurisé" },
            { url: "https://images.unsplash.com/photo-1500382017468-9049fed747ef?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Étêtage sécurisé" }
          ]
        },
        {
          category: "Taille d'entretien régulier",
          images: [
            { url: "https://images.unsplash.com/photo-1516214104703-d870798883c5?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Taille d'entretien" }
          ]
        },
        {
          category: "Intervention professionnelle",
          images: [
            { url: "https://images.unsplash.com/photo-1500382017468-9049fed747ef?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Intervention professionnelle" }
          ]
        }
      ]
    when :abattage
      [
        {
          category: "Abattage dirigé sécurisé",
          images: [
            { url: "https://images.unsplash.com/photo-1473448912268-2022ce9509d8?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Abattage dirigé" },
            { url: "https://images.unsplash.com/photo-1516214104703-d870798883c5?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Abattage dirigé" }
          ]
        },
        {
          category: "Abattage par démontage",
          images: [
            { url: "https://images.unsplash.com/photo-1516214104703-d870798883c5?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Abattage par démontage" },
            { url: "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Abattage par démontage" }
          ]
        },
        {
          category: "Débitage professionnel",
          images: [
            { url: "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Débitage" }
          ]
        },
        {
          category: "Évacuation complète",
          images: [
            { url: "https://images.unsplash.com/photo-1473448912268-2022ce9509d8?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Évacuation" }
          ]
        },
        {
          category: "Intervention professionnelle",
          images: [
            { url: "https://images.unsplash.com/photo-1516214104703-d870798883c5?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Intervention professionnelle" }
          ]
        },
        {
          category: "Nettoyage complet",
          images: [
            { url: "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Nettoyage chantier" }
          ]
        }
      ]
    when :dessouchage
      [
        {
          category: "Dessouchage mécanique",
          images: [
            { url: "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Dessouchage mécanique" },
            { url: "https://images.unsplash.com/photo-1516214104703-d870798883c5?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Dessouchage mécanique" }
          ]
        },
        {
          category: "Dessouchage manuel",
          images: [
            { url: "https://images.unsplash.com/photo-1516214104703-d870798883c5?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Dessouchage manuel" }
          ]
        },
        {
          category: "Nivellement du terrain",
          images: [
            { url: "https://images.unsplash.com/photo-1473448912268-2022ce9509d8?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Nivellement" }
          ]
        },
        {
          category: "Terrain propre et prêt",
          images: [
            { url: "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Terrain propre" }
          ]
        },
        {
          category: "Intervention professionnelle",
          images: [
            { url: "https://images.unsplash.com/photo-1516214104703-d870798883c5?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Intervention professionnelle" }
          ]
        },
        {
          category: "Évacuation complète",
          images: [
            { url: "https://images.unsplash.com/photo-1473448912268-2022ce9509d8?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Évacuation" }
          ]
        }
      ]
    when :entretien
      [
        {
          category: "Taille de haies professionnelle",
          images: [
            { url: "https://images.unsplash.com/photo-1416879595882-3373a0480b5b?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Taille de haies" },
            { url: "https://images.unsplash.com/photo-1516214104703-d870798883c5?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Taille de haies" }
          ]
        },
        {
          category: "Tonte de pelouse régulière",
          images: [
            { url: "https://images.unsplash.com/photo-1516214104703-d870798883c5?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Tonte de pelouse" }
          ]
        },
        {
          category: "Débroussaillage complet",
          images: [
            { url: "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Débroussaillage" }
          ]
        },
        {
          category: "Traitement d'arbres",
          images: [
            { url: "https://images.unsplash.com/photo-1473448912268-2022ce9509d8?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Traitement d'arbres" }
          ]
        },
        {
          category: "Élagage fruitier",
          images: [
            { url: "https://images.unsplash.com/photo-1500382017468-9049fed747ef?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Élagage fruitier" }
          ]
        },
        {
          category: "Entretien jardin complet",
          images: [
            { url: "https://images.unsplash.com/photo-1416879595882-3373a0480b5b?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Entretien jardin" }
          ]
        }
      ]
    else
      []
    end
  end

  def gallery_description(page_key)
    case page_key
    when :elagage
      "Découvrez nos interventions d'élagage en action"
    when :abattage
      "Découvrez nos interventions d'abattage en action"
    when :dessouchage
      "Découvrez nos interventions de dessouchage en action"
    when :entretien
      "Découvrez nos interventions d'entretien en action"
    else
      "Découvrez nos réalisations"
    end
  end
end
