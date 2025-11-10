# Composants Réutilisables

Ce dossier contient des composants réutilisables pour éviter la duplication de code.

## Liste des composants

### 1. `_button_cta.html.erb` - Bouton CTA principal
Bouton pour "Demander un devis gratuit"

**Usage :**
```erb
<%= render "components/button_cta" %>
<%= render "components/button_cta", variant: "secondary", text: "Autre texte", size: "base" %>
```

**Options :**
- `variant` : "primary" (amber, défaut) ou "secondary" (transparent)
- `text` : Texte du bouton (défaut: "Demander un devis gratuit")
- `href` : URL (défaut: "/devis")
- `size` : "lg" (défaut) ou "base"

---

### 2. `_button_phone.html.erb` - Bouton téléphone
Bouton pour appeler directement

**Usage :**
```erb
<%= render "components/button_phone" %>
<%= render "components/button_phone", variant: "secondary", size: "base" %>
```

**Options :**
- `variant` : "primary" (transparent, défaut) ou "secondary" (vert)
- `size` : "lg" (défaut) ou "base"
- `phone` : Numéro affiché (défaut: "07 83 89 23 84")
- `phone_link` : Lien tel: (défaut: "tel:+33783892384")

---

### 3. `_section_header.html.erb` - En-tête de section
Titre + description centré pour les sections

**Usage :**
```erb
<%= render "components/section_header", title: "Mon titre", description: "Ma description" %>
```

**Options :**
- `title` : Titre de la section
- `description` : Description sous le titre
- `title_size` : "4xl" (défaut), "3xl", "2xl"
- `align` : "center" (défaut) ou "left"

---

### 4. `_service_card.html.erb` - Carte de service
Carte pour présenter un service avec icône, description et liste de features

**Usage :**
```erb
<%= render "components/service_card", 
    title: "Élagage", 
    description: "Description...", 
    icon: '<svg>...</svg>',
    icon_color: "green-700",
    bg_gradient: "from-green-50 to-green-100",
    features: ["Feature 1", "Feature 2"],
    image: "url" %>
```

**Options :**
- `title` : Titre du service
- `description` : Description du service
- `icon` : Code SVG de l'icône (utiliser `raw` si nécessaire)
- `icon_color` : Couleur de fond de l'icône (défaut: "green-700")
- `bg_gradient` : Gradient de fond (défaut: "from-green-50 to-green-100")
- `features` : Array de features à afficher
- `image` : URL de l'image de fond (optionnel)

---

### 5. `_stat_card.html.erb` - Carte de statistique
Carte pour afficher une statistique avec icône, valeur et label

**Usage :**
```erb
<%= render "components/stat_card", 
    value: "15+", 
    label: "Années d'expérience",
    icon: '<svg>...</svg>',
    icon_bg: "green-600",
    value_color: "green-700" %>
```

**Options :**
- `value` : Valeur à afficher (ex: "15+", "500+", "4.9/5")
- `label` : Label sous la valeur
- `icon` : Code SVG de l'icône
- `icon_bg` : Couleur de fond de l'icône (défaut: "green-600")
- `value_color` : Couleur de la valeur (défaut: "green-700")

---

### 6. `_badge.html.erb` - Badge/Étiquette
Badge avec icône et texte (utilisé dans les hero sections)

**Usage :**
```erb
<%= render "components/badge", 
    text: "15+ ans d'expérience",
    icon: '<svg>...</svg>',
    bg_color: "amber-400/20",
    border_color: "amber-400/30",
    text_color: "amber-400" %>
```

**Options :**
- `text` : Texte du badge
- `icon` : Code SVG de l'icône (optionnel)
- `bg_color` : Couleur de fond (défaut: "amber-400/20")
- `border_color` : Couleur de la bordure (défaut: "amber-400/30")
- `text_color` : Couleur du texte (défaut: "amber-400")

---

### 7. `_image_overlay.html.erb` - Image avec overlay
Image avec overlay et texte en bas

**Usage :**
```erb
<%= render "components/image_overlay", 
    image: "url",
    alt: "Description",
    title: "Titre",
    subtitle: "Sous-titre",
    aspect: "4/5" %>
```

**Options :**
- `image` : URL de l'image
- `alt` : Texte alternatif
- `title` : Titre affiché en bas (optionnel)
- `subtitle` : Sous-titre affiché en bas (optionnel)
- `aspect` : Ratio d'aspect (défaut: "4/5")
- `rounded` : Arrondi (défaut: "2xl")

---

### 8. `_cta_section.html.erb` - Section CTA complète
Section CTA complète avec titre, description, boutons et stats optionnelles

**Usage :**
```erb
<%= render "components/cta_section", 
    title: "Besoin d'un service ?",
    description: "Description...",
    bg_gradient: "from-green-700 via-green-800 to-green-900",
    badge_text: "Réponse rapide",
    show_stats: true %>
```

**Options :**
- `title` : Titre de la section
- `description` : Description
- `bg_gradient` : Gradient de fond (défaut: "from-green-700 via-green-800 to-green-900")
- `badge_text` : Texte du badge en haut (optionnel)
- `show_stats` : Afficher les stats 24h/100%/7j/7 (défaut: false)
- `image_bg` : URL de l'image de fond (optionnel)

---

## Exemples d'utilisation

### Section avec titre et cartes de service
```erb
<section class="py-24 bg-white">
  <div class="px-6 mx-auto max-w-7xl lg:px-8">
    <%= render "components/section_header", 
        title: "Nos Services", 
        description: "Description des services" %>
    
    <div class="grid gap-8 mt-16 lg:grid-cols-3">
      <%= render "components/service_card", 
          title: "Élagage",
          description: "Description...",
          icon: '<svg>...</svg>',
          features: ["Feature 1", "Feature 2"] %>
    </div>
  </div>
</section>
```

### Section CTA
```erb
<%= render "components/cta_section", 
    title: "Besoin d'un service ?",
    description: "Contactez-nous !",
    show_stats: true %>
```

