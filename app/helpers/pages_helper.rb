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
          category: "Élagage sécurisé",
          images: [
            { url: "https://images.unsplash.com/photo-1500382017468-9049fed747ef?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Taille professionnelle" },
            { url: "https://images.unsplash.com/photo-1516214104703-d870798883c5?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Taille de formation" }
          ]
        },
        {
          category: "Taille sanitaire",
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
          category: "Abattage d'un arbre géant",
          images: [
            { url: "https://cdn.kelcy.fr/website-images/abattage-1.webp", alt: "Abattage d'un arbre géant" },
            { url: "https://cdn.kelcy.fr/website-images/abattage-2.webp", alt: "Abattage d'un arbre géant" },
            { url: "https://cdn.kelcy.fr/website-images/abattage-3.webp", alt: "Abattage d'un arbre géant" },
            { url: "https://cdn.kelcy.fr/website-images/abattage-4.webp", alt: "Abattage d'un arbre géant" }
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
          category: "Démontage contrôlé",
          images: [
            { url: "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Démontage contrôlé" }
          ]
        },
        {
          category: "Démontage avec rétention",
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
          category: "Rognage ou grignotage",
          images: [
            { url: "https://images.unsplash.com/photo-1516214104703-d870798883c5?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Rognage ou grignotage" }
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
          category: "Démontage avec rétention",
          images: [
            { url: "https://images.unsplash.com/photo-1473448912268-2022ce9509d8?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80", alt: "Démontage avec rétention" }
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
          "Depuis plus de 10 ans, nous mettons notre expertise au service de vos projets. Que ce soit pour un élagage sécurisé, une taille sanitaire ou une taille raisonnée, nous intervenons avec professionnalisme et respect de l'environnement."
        ],
        image_url: "/images/elagage/1 section élagage carré 10 ans d'exp",
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
        image_url: "/images/abattage/1_L'Abattage, Une Expertise Technique carré 100% securisé",
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
        image_url: "/images/dessouchage/1_1 le dessouchage la finition parfaite 100% elimination complete",
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
        image_url: "/images/entretien/1_Des services complets.. service d'entretien",
        image_alt: "Entretien jardin",
        show_service_logo: true,
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
            title: "Élagage Sécurisé",
            description: "L'élagage sécurisé est notre priorité. Nous intervenons avec toutes les précautions nécessaires pour garantir la sécurité des personnes et des biens, tout en préservant la santé de l'arbre.",
            image_url: "/images/elagage/1-1 Nos technique d'élagage (carré élagage sécurisé)",
            image_alt: "Élagage sécurisé",
            icon_color: "green-700",
            features: [
              "Sécurité maximale",
              "Protection des biens",
              "Techniques professionnelles"
            ]
          },
          {
            title: "Taille Sanitaire",
            description: "La taille sanitaire permet d'éliminer les branches mortes, malades ou dangereuses pour préserver la santé de l'arbre. Cette intervention est essentielle pour maintenir vos arbres en bon état.",
            image_url: "/images/elagage/1-2 Nos technique d'élagage (carré taille sanitaire)",
            image_alt: "Taille sanitaire",
            icon_color: "green-700",
            features: [
              "Élimination des branches mortes",
              "Préservation de la santé",
              "Prévention des maladies"
            ]
          },
          {
            title: "Taille Raisonnée",
            description: "La taille raisonnée respecte la biologie et la forme naturelle de l'arbre. Nous intervenons avec précaution pour préserver l'esthétique et la santé de vos arbres tout en répondant à vos besoins.",
            image_url: "/images/elagage/1-3 Nos technique d'élagage (carré taille raisonnée)",
            image_alt: "Taille raisonnée",
            icon_color: "amber-700",
            features: [
              "Respect de la biologie",
              "Préservation de l'esthétique",
              "Intervention adaptée"
            ]
          },
          {
            title: "Taille en Tête de Chat",
            description: "La taille en tête de chat consiste à couper la cime de l'arbre pour réduire significativement sa hauteur. Cette intervention doit être réalisée avec précaution car elle peut affecter la santé de l'arbre. Nous pratiquons cette taille uniquement lorsque c'est nécessaire et avec les techniques appropriées.",
            image_url: "/images/elagage/1-4 Nos technique d'élagage (carré taille en tete de chat)",
            image_alt: "Taille en tête de chat",
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
            image_url: "/images/abattage/2_1 Nos technique d'abattage carré 1 abattage dirigé",
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
            image_url: "/images/abattage/2_2 Nos technique d'abattage carré2 abattage par démontage",
            image_alt: "Abattage par démontage",
            icon_color: "green-700",
            features: [
              "Technique sécurisée",
              "Adaptée aux espaces réduits",
              "Contrôle total de la chute"
            ]
          },
          {
            title: "Démontage Contrôlé",
            description: "Le démontage contrôlé permet d'abattre un arbre en toute sécurité, même dans des espaces restreints. Nous procédons morceau par morceau pour garantir la sécurité de tous.",
            image_url: "/images/abattage/2_3 Nos technique d'abattage carré3 démontage controlé",
            image_alt: "Démontage contrôlé",
            icon_color: "green-700",
            features: [
              "Technique sécurisée",
              "Espaces restreints",
              "Contrôle total"
            ]
          },
          {
            title: "Démontage avec Rétention",
            description: "Le démontage avec rétention est utilisé lorsque l'arbre doit être abattu avec un contrôle maximal. Nous utilisons des techniques de rétention pour guider chaque section de l'arbre.",
            image_url: "/images/abattage/2_4 Nos technique d'abattage carré4 démontage avec retention",
            image_alt: "Démontage avec rétention",
            icon_color: "green-700",
            features: [
              "Rétention des sections",
              "Contrôle maximal",
              "Sécurité optimale"
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
            image_url: "/images/dessouchage/Nos technique de dessouchage 2_1",
            image_alt: "Dessouchage mécanique",
            icon_color: "green-700",
            features: [
              "Souches de toutes tailles",
              "Intervention rapide",
              "Élimination complète"
            ]
          },
          {
            title: "Rognage ou Grignotage",
            description: "Pour les souches plus petites ou dans les espaces restreints, nous procédons par rognage ou grignotage. Cette technique permet un travail précis et respectueux de votre terrain.",
            image_url: "/images/dessouchage/Nos technique de dessouchage 2_2 rognage ou grignotage",
            image_alt: "Rognage ou grignotage",
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
            image_url: "/images/dessouchage/Nos technique de dessouchage 2_3 terrain propre",
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
            image_url: "/images/entretien/2_1 Nos services dentretien-Taille de haie",
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
            image_url: "/images/entretien/2_2 Nos services dentretien- tonte de pelouse",
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
            image_url: "/images/entretien/2_3 nos services dentretien-debroussaillage",
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
            image_url: "/images/entretien/2_4 nos service dentretien- traitement darbre",
            image_alt: "Traitement d'arbres",
            icon_color: "green-700",
            features: [
              "Traitement préventif",
              "Lutte contre les maladies",
              "Protection des arbres"
            ]
          },
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
            image_url: "/images/elagage/3-1 les derniers carrés sécurité avant tout",
            image_alt: "Sécurité",
            icon_color: "green-700",
            bg_color: "green-50",
            border_color: "green-100"
          },
          {
            title: "Respect de la Biologie",
            description: "Nous respectons la biologie de chaque arbre. Chaque coupe est réfléchie pour préserver la santé et l'esthétique naturelle de l'arbre, tout en répondant à vos besoins.",
            image_url: "/images/elagage/3-2 les derniers carré respect de la biologie",
            image_alt: "Respect de la biologie",
            icon_color: "amber-700",
            bg_color: "amber-50",
            border_color: "amber-100"
          },
          {
            title: "10+ Ans d'Expérience",
            description: "Notre passion pour les arbres nous pousse à nous former continuellement. Nous maîtrisons les dernières techniques et normes professionnelles pour vous garantir un travail de qualité.",
            image_url: "/images/elagage/3-3 les derniers carrés '10 ans d'experience",
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
            image_url: "/images/abattage/4_1 choisir notre service d'abattage_ securité maximale",
            image_alt: "Sécurité",
            icon_color: "green-700",
            bg_color: "green-50",
            border_color: "green-100"
          },
          {
            title: "Techniques Adaptées",
            description: "Nous maîtrisons toutes les techniques d'abattage, de l'abattage dirigé à l'abattage par démontage. Nous adaptons notre méthode à chaque situation pour garantir un travail de qualité.",
            image_url: "/images/abattage/4_2pourquoi choisir notre service d'abattage technqiue adapté",
            image_alt: "Techniques",
            icon_color: "amber-700",
            bg_color: "amber-50",
            border_color: "amber-100"
          },
          {
            title: "Démontage avec Rétention",
            description: "Le démontage avec rétention permet d'abattre un arbre avec un contrôle maximal. Nous utilisons des techniques de rétention pour guider chaque section de l'arbre en toute sécurité.",
            image_url: "/images/abattage/4_3 pourquoi choisir notre service d'abattage 3_Démontage avec retention",
            image_alt: "Démontage avec rétention",
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
            image_url: "/images/dessouchage/pourquoi choisir notre service de dessouchage 5_1 élimination complete",
            image_alt: "Élimination",
            icon_color: "green-700",
            bg_color: "green-50",
            border_color: "green-100"
          },
          {
            title: "Techniques Adaptées",
            description: "Dessouchage mécanique pour les grandes souches, rognage ou grignotage pour les plus petites, nous adaptons notre méthode à chaque situation pour garantir un travail de qualité.",
            image_url: "/images/dessouchage/pourquoi choisir notre service de dessouchage 5_2 technque adapté",
            image_alt: "Techniques",
            icon_color: "amber-700",
            bg_color: "amber-50",
            border_color: "amber-100"
          },
          {
            title: "Terrain Propre",
            description: "Après le dessouchage, nous nettoyons complètement le terrain et le remettons en état. Vous pouvez ainsi reprendre vos projets d'aménagement immédiatement.",
            image_url: "/images/dessouchage/pourquoi choisir notre service de dessouchage 5_3 terrain propre",
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
            image_url: "/images/entretien/4_1 pourquoi choisir nos service dentretien-gamme complete",
            image_alt: "Gamme complète",
            icon_color: "green-700",
            bg_color: "green-50",
            border_color: "green-100"
          },
          {
            title: "Entretien Régulier",
            description: "Nous proposons des services d'entretien réguliers pour maintenir vos espaces verts en parfait état tout au long de l'année. Un jardin bien entretenu, c'est un jardin qui respire la santé.",
            image_url: "/images/entretien/4_2 pourquoi choisir nos services dentretien-entretien regulier",
            image_alt: "Entretien régulier",
            icon_color: "amber-700",
            bg_color: "amber-50",
            border_color: "amber-100"
          },
          {
            title: "Expertise Arboricole",
            description: "Notre expertise en arboriculture nous permet de prendre soin de vos arbres avec les techniques les plus appropriées. Nous respectons la biologie de chaque arbre pour préserver sa santé.",
            image_url: "/images/entretien/4_3 pourquoi choisir nos services dentretien-expertise arboricole",
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

  # Retourne la liste des avis clients pour le slider
  def client_reviews
    [
      {
        rating: 5,
        text: "MR Dubois vient de terminer un chantier important, il a coupé une dizaine de Thuyas dont certains de grande hauteur devenaient problématiques pour la sécurité de ma maison et de celles des voisins.
              J'ai consulté plusieurs entreprises, c'était le mieux placé. Le travail à été réalisé par une équipe de professionnels dans les délais annoncés au départ et conformément au cahier des charges défini ensemble. Le chantier a été très bien nettoyé.
              Personne sympathique et de confiance, je ferai à nouveau appel à ses services.",
        author_name: "Philippe G.",
        author_initials: "PG"
      },
      {
        rating: 5,
        text: "Sapin abattu et évacué comme souhaité, avec une urgence sur un autre chantier, travail réalisé et terminé dès le lendemain. Je recommande cette entreprise les yeux fermés.",
        author_name: "Sandrine G.",
        author_initials: "SG"
      },
      {
        rating: 5,
        text: "Elagages respectueux de bouleaux anciens. Travail soigné et délais d'intervention respectés. Artisan à recommander.",
        author_name: "Marie-Laurence P.",
        author_initials: "MLP"
      },
      {
        rating: 5,
        text: "Appel à Monsieur Dubois pour l’élagage d’un noyer. Travail soigné et conseils professionnels. Parfait.",
        author_name: "Didier S.",
        author_initials: "DS"
      },
      {
        rating: 5,
        text: "Prestation très professionnelle pour élagage d’un tilleul, abattage d un cyprès et coupe d’une forêt de miyawaki avec dessouchage. Chantier rondement mené, en toute sécurité et propreté. Je recommande vivement.",
        author_name: "Florent M.",
        author_initials: "FM"
      },
      {
        rating: 5,
        text: "Élagage ce jour ! Très bon professionnel ! Merci M Dubois pour votre rapidité et pour la qualité de votre travail .",
        author_name: "Anne-Marie C.",
        author_initials: "AMC"
      }
    ]
  end

  # Génère les étoiles pour un rating donné
  def render_stars(rating)
    (1..5).map do |i|
      if i <= rating
        '<svg class="w-5 h-5 text-amber-400" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" /></svg>'
      else
        '<svg class="w-5 h-5 text-gray-300" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" /></svg>'
      end
    end.join.html_safe
  end
end
