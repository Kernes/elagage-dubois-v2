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

  # Retourne les données pour la section introduction d'une page de service
  def service_introduction(page_key)
    case page_key
    when :elagage
      {
        title: "L'Élagage, Bien Plus Qu'une Simple Taille",
        paragraphs: [
          "L'élagage, c'est un art que nous pratiquons avec passion. Chaque arbre est unique, chaque intervention est réfléchie, chaque coupe est mûrement pensée. Nous respectons la biologie de chaque arbre pour préserver sa santé, son esthétique et votre sécurité.",
          "Depuis plus de 10 ans, nous mettons notre expertise au service de vos projets. Que ce soit pour une taille de formation, une réduction de couronne ou un étêtage, nous intervenons avec professionnalisme et respect de l'environnement."
        ],
        image_url: "https://images.unsplash.com/photo-1516214104703-d870798883c5?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
        image_alt: "Élagage professionnel",
        badge: {
          value: "10+",
          label: "Années d'expérience",
          icon_color: "green-700"
        }
      }
    when :abattage
      {
        title: "L'Abattage, Une Expertise Technique",
        paragraphs: [
          "L'abattage demande une expertise technique que nous avons acquise au fil des années. Chaque intervention est planifiée avec soin, chaque geste est calculé pour garantir la sécurité de tous. C'est un travail que nous prenons très au sérieux.",
          "Que ce soit pour un arbre dangereux, un arbre malade ou un projet d'aménagement, nous intervenons avec professionnalisme et respect de l'environnement. Nous maîtrisons toutes les techniques d'abattage, de l'abattage dirigé à l'abattage par démontage."
        ],
        image_url: "https://images.unsplash.com/photo-1473448912268-2022ce9509d8?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
        image_alt: "Abattage professionnel",
        badge: {
          value: "100%",
          label: "Sécurisé",
          icon_color: "amber-700"
        }
      }
    when :dessouchage
      {
        title: "Le Dessouchage, La Finition Parfaite",
        paragraphs: [
          "Le dessouchage, c'est la finition parfaite d'un travail bien fait. Après l'abattage d'un arbre, la souche reste souvent en place, encombrant votre terrain et empêchant vos projets d'aménagement.",
          "Nous utilisons les techniques les plus adaptées pour éliminer complètement la souche, qu'elle soit petite ou imposante. Dessouchage mécanique pour les grandes souches, dessouchage manuel pour les plus petites, nous adaptons notre méthode à chaque situation."
        ],
        image_url: "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
        image_alt: "Dessouchage professionnel",
        badge: {
          value: "100%",
          label: "Élimination complète",
          icon_color: "amber-800"
        }
      }
    when :entretien
      {
        title: "Des Services Complets pour Vos Espaces Verts",
        paragraphs: [
          "Nous sommes spécialistes des arbres, mais pas que ! Au-delà de nos services principaux d'élagage, d'abattage et de dessouchage, nous proposons également une gamme complète de services d'entretien pour prendre soin de vos espaces verts tout au long de l'année.",
          "Que ce soit pour l'entretien régulier de votre jardin, la taille de vos haies, la tonte de votre pelouse, le débroussaillage ou le traitement de vos arbres, nous avons les compétences et l'expérience nécessaires pour répondre à tous vos besoins."
        ],
        image_url: "https://images.unsplash.com/photo-1416879595882-3373a0480b5b?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
        image_alt: "Entretien jardin",
        badge: {
          value: "5+",
          label: "Services d'entretien",
          icon_color: "green-700"
        }
      }
    else
      {}
    end
  end

  # Retourne les données pour la section techniques/services d'une page de service
  def service_techniques(page_key)
    case page_key
    when :elagage
      {
        title: "Nos Techniques d'Élagage",
        subtitle: "Des interventions adaptées à chaque situation",
        techniques: [
          {
            title: "Taille de Formation",
            description: "Pour les jeunes arbres, la taille de formation est essentielle. Elle permet de guider la croissance de l'arbre dès son plus jeune âge, en favorisant une structure solide et équilibrée. Nous intervenons avec précaution pour ne pas compromettre le développement futur de l'arbre.",
            image_url: "https://images.unsplash.com/photo-1500382017468-9049fed747ef?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
            image_alt: "Taille de formation",
            icon_color: "green-700",
            features: [
              "Intervention sur jeunes arbres",
              "Structure équilibrée",
              "Croissance guidée"
            ]
          },
          {
            title: "Taille d'Entretien",
            description: "La taille d'entretien permet de maintenir la santé et la forme de vos arbres adultes. Nous intervenons régulièrement pour éliminer les branches mortes, malades ou dangereuses, tout en préservant l'esthétique naturelle de l'arbre.",
            image_url: "https://images.unsplash.com/photo-1516214104703-d870798883c5?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
            image_alt: "Taille d'entretien",
            icon_color: "green-700",
            features: [
              "Élimination des branches mortes",
              "Préservation de l'esthétique",
              "Maintien de la santé"
            ]
          },
          {
            title: "Réduction de Couronne",
            description: "La réduction de couronne permet de diminuer la hauteur et l'envergure d'un arbre tout en préservant sa forme naturelle. Cette technique est idéale pour limiter l'ombre, réduire les risques de chute ou adapter l'arbre à son environnement.",
            image_url: "https://images.unsplash.com/photo-1473448912268-2022ce9509d8?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
            image_alt: "Réduction de couronne",
            icon_color: "amber-700",
            features: [
              "Réduction de la hauteur",
              "Préservation de la forme",
              "Réduction des risques"
            ]
          },
          {
            title: "Étêtage",
            description: "L'étêtage consiste à couper la cime de l'arbre pour réduire significativement sa hauteur. Cette intervention doit être réalisée avec précaution car elle peut affecter la santé de l'arbre. Nous pratiquons l'étêtage uniquement lorsque c'est nécessaire et avec les techniques appropriées.",
            image_url: "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
            image_alt: "Étêtage",
            icon_color: "amber-800",
            features: [
              "Réduction de hauteur importante",
              "Techniques appropriées",
              "Intervention sécurisée"
            ]
          }
        ]
      }
    when :abattage
      {
        title: "Nos Techniques d'Abattage",
        subtitle: "Des interventions adaptées à chaque situation",
        techniques: [
          {
            title: "Abattage Dirigé",
            description: "L'abattage dirigé est la technique la plus courante pour les arbres qui ont suffisamment d'espace autour d'eux. Nous calculons précisément la direction de chute pour éviter tout dommage aux biens environnants.",
            image_url: "https://images.unsplash.com/photo-1473448912268-2022ce9509d8?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
            image_alt: "Abattage dirigé",
            icon_color: "green-700",
            features: [
              "Calcul précis de la direction",
              "Protection des biens environnants",
              "Intervention rapide et efficace"
            ]
          },
          {
            title: "Abattage par Démontage",
            description: "Lorsque l'espace est limité ou que l'arbre est dangereux, nous procédons par démontage. Cette technique consiste à couper l'arbre morceau par morceau, en commençant par le haut, pour garantir la sécurité de tous.",
            image_url: "https://images.unsplash.com/photo-1516214104703-d870798883c5?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
            image_alt: "Abattage par démontage",
            icon_color: "green-700",
            features: [
              "Technique sécurisée",
              "Adaptée aux espaces réduits",
              "Contrôle total de la chute"
            ]
          },
          {
            title: "Débitage et Évacuation",
            description: "Après l'abattage, nous procédons au débitage de l'arbre en sections transportables. Nous évacuons ensuite tous les déchets, laissant votre terrain propre et prêt pour vos projets.",
            image_url: "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
            image_alt: "Débitage",
            icon_color: "green-700",
            features: [
              "Débitage professionnel",
              "Évacuation complète",
              "Terrain propre"
            ]
          }
        ]
      }
    when :dessouchage
      {
        title: "Nos Techniques de Dessouchage",
        subtitle: "Des interventions adaptées à chaque situation",
        techniques: [
          {
            title: "Dessouchage Mécanique",
            description: "Pour les grandes souches, nous utilisons des engins mécaniques spécialisés. Cette technique permet d'éliminer rapidement et efficacement les souches les plus imposantes, même celles de plusieurs mètres de diamètre.",
            image_url: "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
            image_alt: "Dessouchage mécanique",
            icon_color: "green-700",
            features: [
              "Souches de toutes tailles",
              "Intervention rapide",
              "Élimination complète"
            ]
          },
          {
            title: "Dessouchage Manuel",
            description: "Pour les souches plus petites ou dans les espaces restreints, nous procédons manuellement. Cette technique permet un travail précis et respectueux de votre terrain.",
            image_url: "https://images.unsplash.com/photo-1516214104703-d870798883c5?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
            image_alt: "Dessouchage manuel",
            icon_color: "green-700",
            features: [
              "Travail précis",
              "Respect du terrain",
              "Adapté aux petits espaces"
            ]
          },
          {
            title: "Nettoyage et Remise en État",
            description: "Après le dessouchage, nous nettoyons complètement le terrain et le remettons en état. Vous pouvez ainsi reprendre vos projets d'aménagement immédiatement.",
            image_url: "https://images.unsplash.com/photo-1473448912268-2022ce9509d8?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
            image_alt: "Nettoyage",
            icon_color: "green-700",
            features: [
              "Nettoyage complet",
              "Remise en état",
              "Terrain prêt"
            ]
          }
        ]
      }
    when :entretien
      {
        title: "Nos Services d'Entretien",
        subtitle: "Une gamme complète pour tous vos besoins",
        techniques: [
          {
            title: "Taille de Haies",
            description: "Des haies bien taillées, c'est l'élégance de votre jardin. Nous intervenons régulièrement pour maintenir vos haies en parfait état, qu'elles soient basses ou hautes, droites ou arrondies.",
            image_url: "https://images.unsplash.com/photo-1416879595882-3373a0480b5b?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
            image_alt: "Taille de haies",
            icon_color: "green-700",
            features: [
              "Taille régulière",
              "Formes variées",
              "Haies de toutes tailles"
            ]
          },
          {
            title: "Tonte de Pelouse",
            description: "Une pelouse bien entretenue, c'est la base d'un jardin soigné. Nous proposons des services de tonte réguliers pour maintenir votre pelouse en parfait état tout au long de la saison.",
            image_url: "https://images.unsplash.com/photo-1516214104703-d870798883c5?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
            image_alt: "Tonte de pelouse",
            icon_color: "green-700",
            features: [
              "Tonte régulière",
              "Entretien saisonnier",
              "Pelouse impeccable"
            ]
          },
          {
            title: "Débroussaillage",
            description: "Le débroussaillage permet de nettoyer vos espaces verts en éliminant les broussailles, les ronces et les végétaux indésirables. Nous intervenons pour maintenir vos terrains propres et accessibles.",
            image_url: "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
            image_alt: "Débroussaillage",
            icon_color: "green-700",
            features: [
              "Nettoyage complet",
              "Élimination des ronces",
              "Terrain accessible"
            ]
          },
          {
            title: "Traitement d'Arbres",
            description: "Nous proposons également des services de traitement pour préserver la santé de vos arbres. Que ce soit pour lutter contre les maladies ou les parasites, nous intervenons avec les produits adaptés.",
            image_url: "https://images.unsplash.com/photo-1473448912268-2022ce9509d8?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
            image_alt: "Traitement d'arbres",
            icon_color: "green-700",
            features: [
              "Traitement préventif",
              "Lutte contre les maladies",
              "Protection des arbres"
            ]
          },
          {
            title: "Élagage Fruitier",
            description: "L'élagage des arbres fruitiers nécessite une expertise particulière. Nous intervenons pour optimiser la production de fruits tout en préservant la santé de l'arbre.",
            image_url: "https://images.unsplash.com/photo-1500382017468-9049fed747ef?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
            image_alt: "Élagage fruitier",
            icon_color: "amber-700",
            features: [
              "Taille spécialisée",
              "Optimisation de la production",
              "Fruits de qualité"
            ]
          }
        ]
      }
    else
      {}
    end
  end

  # Retourne les données pour la section "Pourquoi choisir" d'une page de service
  def service_why_choose(page_key)
    case page_key
    when :elagage
      {
        title: "Pourquoi Choisir Notre Service d'Élagage ?",
        subtitle: "Une expertise reconnue, une passion pour les arbres",
        reasons: [
          {
            title: "Sécurité Avant Tout",
            description: "Chaque intervention est planifiée avec soin pour garantir la sécurité de tous. Nous respectons les normes de sécurité les plus strictes et utilisons les équipements de protection individuelle adaptés.",
            image_url: "https://images.unsplash.com/photo-1516214104703-d870798883c5?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
            image_alt: "Sécurité",
            icon_color: "green-700",
            bg_color: "green-50",
            border_color: "green-100"
          },
          {
            title: "Respect de la Biologie",
            description: "Nous respectons la biologie de chaque arbre. Chaque coupe est réfléchie pour préserver la santé et l'esthétique naturelle de l'arbre, tout en répondant à vos besoins.",
            image_url: "https://images.unsplash.com/photo-1500382017468-9049fed747ef?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
            image_alt: "Respect de la biologie",
            icon_color: "amber-700",
            bg_color: "amber-50",
            border_color: "amber-100"
          },
          {
            title: "10+ Ans d'Expérience",
            description: "Notre passion pour les arbres nous pousse à nous former continuellement. Nous maîtrisons les dernières techniques et normes professionnelles pour vous garantir un travail de qualité.",
            image_url: "https://images.unsplash.com/photo-1473448912268-2022ce9509d8?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
            image_alt: "Expérience",
            icon_color: "green-700",
            bg_color: "green-50",
            border_color: "green-100"
          }
        ]
      }
    when :abattage
      {
        title: "Pourquoi Choisir Notre Service d'Abattage ?",
        subtitle: "Une expertise technique reconnue",
        reasons: [
          {
            title: "Sécurité Maximale",
            description: "L'abattage est une opération dangereuse qui nécessite une expertise technique. Nous respectons toutes les normes de sécurité et utilisons les équipements de protection adaptés pour garantir la sécurité de tous.",
            image_url: "https://images.unsplash.com/photo-1473448912268-2022ce9509d8?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
            image_alt: "Sécurité",
            icon_color: "green-700",
            bg_color: "green-50",
            border_color: "green-100"
          },
          {
            title: "Techniques Adaptées",
            description: "Nous maîtrisons toutes les techniques d'abattage, de l'abattage dirigé à l'abattage par démontage. Nous adaptons notre méthode à chaque situation pour garantir un travail de qualité.",
            image_url: "https://images.unsplash.com/photo-1516214104703-d870798883c5?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
            image_alt: "Techniques",
            icon_color: "amber-700",
            bg_color: "amber-50",
            border_color: "amber-100"
          },
          {
            title: "Évacuation Complète",
            description: "Après l'abattage, nous procédons au débitage et à l'évacuation complète de tous les déchets. Votre terrain est laissé propre et prêt pour vos projets.",
            image_url: "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
            image_alt: "Évacuation",
            icon_color: "green-700",
            bg_color: "green-50",
            border_color: "green-100"
          }
        ]
      }
    when :dessouchage
      {
        title: "Pourquoi Choisir Notre Service de Dessouchage ?",
        subtitle: "Une finition parfaite pour vos projets",
        reasons: [
          {
            title: "Élimination Complète",
            description: "Nous garantissons l'élimination complète de la souche, qu'elle soit petite ou imposante. Nous utilisons les techniques les plus adaptées pour chaque situation.",
            image_url: "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
            image_alt: "Élimination",
            icon_color: "green-700",
            bg_color: "green-50",
            border_color: "green-100"
          },
          {
            title: "Techniques Adaptées",
            description: "Dessouchage mécanique pour les grandes souches, dessouchage manuel pour les plus petites, nous adaptons notre méthode à chaque situation pour garantir un travail de qualité.",
            image_url: "https://images.unsplash.com/photo-1516214104703-d870798883c5?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
            image_alt: "Techniques",
            icon_color: "amber-700",
            bg_color: "amber-50",
            border_color: "amber-100"
          },
          {
            title: "Terrain Propre",
            description: "Après le dessouchage, nous nettoyons complètement le terrain et le remettons en état. Vous pouvez ainsi reprendre vos projets d'aménagement immédiatement.",
            image_url: "https://images.unsplash.com/photo-1473448912268-2022ce9509d8?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
            image_alt: "Terrain propre",
            icon_color: "green-700",
            bg_color: "green-50",
            border_color: "green-100"
          }
        ]
      }
    when :entretien
      {
        title: "Pourquoi Choisir Nos Services d'Entretien ?",
        subtitle: "Une expertise complète pour vos espaces verts",
        reasons: [
          {
            title: "Gamme Complète",
            description: "Nous proposons une gamme complète de services d'entretien pour prendre soin de tous vos espaces verts. De la taille de haies à la tonte de pelouse, nous avons les compétences nécessaires.",
            image_url: "https://images.unsplash.com/photo-1416879595882-3373a0480b5b?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
            image_alt: "Gamme complète",
            icon_color: "green-700",
            bg_color: "green-50",
            border_color: "green-100"
          },
          {
            title: "Entretien Régulier",
            description: "Nous proposons des services d'entretien réguliers pour maintenir vos espaces verts en parfait état tout au long de l'année. Un jardin bien entretenu, c'est un jardin qui respire la santé.",
            image_url: "https://images.unsplash.com/photo-1516214104703-d870798883c5?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
            image_alt: "Entretien régulier",
            icon_color: "amber-700",
            bg_color: "amber-50",
            border_color: "amber-100"
          },
          {
            title: "Expertise Arboricole",
            description: "Notre expertise en arboriculture nous permet de prendre soin de vos arbres avec les techniques les plus appropriées. Nous respectons la biologie de chaque arbre pour préserver sa santé.",
            image_url: "https://images.unsplash.com/photo-1473448912268-2022ce9509d8?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80",
            image_alt: "Expertise",
            icon_color: "green-700",
            bg_color: "green-50",
            border_color: "green-100"
          }
        ]
      }
    else
      {}
    end
  end

  # Retourne les données pour la section CTA d'une page de service
  def service_cta(page_key)
    case page_key
    when :elagage
      {
        title: "Besoin d'un Élagage Professionnel ?",
        description: "Contactez-nous pour un devis gratuit et personnalisé. Nous intervenons rapidement dans toute l'Île-de-France."
      }
    when :abattage
      {
        title: "Besoin d'un Abattage Professionnel ?",
        description: "Contactez-nous pour un devis gratuit et personnalisé. Nous intervenons rapidement dans toute l'Île-de-France."
      }
    when :dessouchage
      {
        title: "Besoin d'un Dessouchage Professionnel ?",
        description: "Contactez-nous pour un devis gratuit et personnalisé. Nous intervenons rapidement dans toute l'Île-de-France."
      }
    when :entretien
      {
        title: "Besoin de Services d'Entretien ?",
        description: "Contactez-nous pour un devis gratuit et personnalisé. Nous intervenons rapidement dans toute l'Île-de-France."
      }
    else
      {
        title: "Besoin de Nos Services ?",
        description: "Contactez-nous pour un devis gratuit et personnalisé. Nous intervenons rapidement dans toute l'Île-de-France."
      }
    end
  end
end
