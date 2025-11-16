# Guide SEO Complet - Élagage Dubois

## 📋 Vue d'ensemble

Ce guide documente tous les éléments SEO implémentés sur le site Élagage Dubois pour optimiser le référencement naturel et la visibilité sur les moteurs de recherche.

## ✅ Éléments SEO Implémentés

### 1. Balises Meta Optimisées

#### Balises de base
- **Title** : Unique et optimisé pour chaque page (50-60 caractères)
- **Description** : 150-160 caractères, incluant mots-clés pertinents
- **Keywords** : Géolocalisés et spécifiques aux services
- **Author** : Élagage Dubois
- **Robots** : `index, follow`
- **Canonical URL** : URLs canoniques pour éviter le contenu dupliqué

#### Configuration par page
Toutes les pages ont leurs propres balises meta configurées dans `app/helpers/seo_helper.rb` :
- Page d'accueil
- Élagage
- Abattage
- Dessouchage
- Entretien
- Devis
- Qui sommes-nous
- Recrutement
- Pages légales

### 2. Open Graph & Twitter Card

#### Open Graph (Facebook, LinkedIn, etc.)
- `og:type` : website
- `og:url` : URL de la page
- `og:title` : Titre optimisé
- `og:description` : Description optimisée
- `og:image` : Image 1200x630px
- `og:locale` : fr_FR
- `og:site_name` : Élagage Dubois

#### Twitter Card
- `twitter:card` : summary_large_image
- `twitter:title` : Titre optimisé
- `twitter:description` : Description optimisée
- `twitter:image` : Image optimisée
- `twitter:site` : @elagage_dubois
- `twitter:creator` : @elagage_dubois

### 3. Données Structurées JSON-LD (Schema.org)

#### Types de données structurées implémentés

1. **LocalBusiness**
   - Informations de l'entreprise
   - Coordonnées (adresse, téléphone, email)
   - Zone d'intervention (Île-de-France)
   - Horaires d'ouverture
   - Catalogue de services

2. **Organization**
   - Structure organisationnelle
   - Logo
   - Point de contact
   - Adresse

3. **WebSite**
   - Informations du site web
   - Action de recherche potentielle

4. **Service** (pour chaque page de service)
   - Nom du service
   - Description
   - Fournisseur (LocalBusiness)
   - Zone de service
   - Canaux de contact

5. **FAQPage** (page d'accueil)
   - Questions fréquentes
   - Réponses structurées

6. **BreadcrumbList** (pages internes)
   - Fil d'Ariane pour la navigation

### 4. Sitemap XML

#### Configuration
- **Fichier** : `app/views/pages/sitemap.xml.erb`
- **Route** : `/sitemap.xml`
- **Format** : XML conforme au standard sitemaps.org

#### Priorités
- Page d'accueil : 1.0
- Pages de services (élagage, abattage, dessouchage, entretien) : 0.9
- Page de devis : 0.8
- Qui sommes-nous : 0.8
- Recrutement : 0.6
- Pages légales : 0.3

#### Fréquences de mise à jour
- Page d'accueil : weekly
- Pages de services : monthly
- Pages légales : yearly

#### Images incluses
- Chaque URL inclut une image avec titre et description

### 5. Robots.txt

#### Configuration
- **Fichier** : `public/robots.txt`
- **Sitemap référencé** : https://elagage-dubois-v2.scalingo.io/sitemap.xml

#### Règles
- **User-agent: *** : Crawl-delay de 1 seconde
- **User-agent: Googlebot** : Crawl-delay de 1 seconde
- **User-agent: Bingbot** : Crawl-delay de 2 secondes
- **User-agent: YandexBot** : Crawl-delay de 2 secondes

#### Pages autorisées
- Page d'accueil
- Pages de services (élagage, abattage, dessouchage, entretien)
- Page de devis
- Qui sommes-nous
- Recrutement
- Pages légales

#### Fichiers interdits
- Fichiers système (/admin/, /tmp/, /log/, etc.)
- Fichiers de configuration
- Assets et composants internes

## 🎯 Optimisations Techniques

### Performance
- **Préchargement** : Ressources critiques (images, CSS, JS)
- **Préconnexion** : Domaines externes (Google Fonts, CDN)
- **DNS Prefetch** : Résolution DNS anticipée

### Accessibilité
- **Alt tags** : Toutes les images ont des attributs alt descriptifs
- **Structure sémantique** : Utilisation de balises HTML5 appropriées
- **Langue** : `lang="fr"` sur la balise `<html>`

### Mobile
- **Viewport** : Configuré pour le responsive
- **Apple touch icon** : Icône pour iOS
- **Mobile web app capable** : Configuration pour PWA

## 📝 Utilisation

### Dans les vues

#### Définir des meta tags personnalisés
```erb
<% content_for :title, "Titre personnalisé" %>
<% content_for :description, "Description personnalisée" %>
<% content_for :keywords, "mots, clés, personnalisés" %>
<% content_for :og_title, "Titre Open Graph" %>
<% content_for :og_description, "Description Open Graph" %>
<% content_for :og_image, "https://example.com/image.jpg" %>
```

#### Ajouter des données structurées
```erb
<% content_for :head do %>
  <script type="application/ld+json">
  <%= raw structured_data_service(
    "Élagage",
    "Service d'élagage professionnel : élagage sécurisé, taille sanitaire, taille raisonnée"
  ).to_json %>
  </script>
<% end %>
```

#### Ajouter un fil d'Ariane
```erb
<% content_for :head do %>
  <script type="application/ld+json">
  <%= raw structured_data_breadcrumb([
    { name: "Accueil", url: root_path },
    { name: "Élagage", url: elagage_path }
  ]).to_json %>
  </script>
<% end %>
```

### Dans le helper SEO

Toutes les configurations SEO sont centralisées dans `app/helpers/seo_helper.rb` :
- `DEFAULT_SEO` : Configuration par défaut
- `PAGE_SEO` : Configuration par page
- Méthodes helper pour générer les balises meta
- Méthodes pour générer les données structurées

## 🔍 Vérification SEO

### Outils recommandés
1. **Google Search Console** : Suivi de l'indexation et des performances
2. **Google Rich Results Test** : Vérification des données structurées
3. **PageSpeed Insights** : Performance et Core Web Vitals
4. **Schema.org Validator** : Validation des données structurées
5. **Screaming Frog** : Audit technique complet

### Checklist de vérification
- [ ] Toutes les pages ont un titre unique
- [ ] Toutes les pages ont une description optimisée
- [ ] Les URLs sont propres et descriptives
- [ ] Les images ont des alt tags
- [ ] Le sitemap est accessible et valide
- [ ] Le robots.txt est correctement configuré
- [ ] Les données structurées sont valides
- [ ] Les balises Open Graph sont présentes
- [ ] Les balises Twitter Card sont présentes
- [ ] Les URLs canoniques sont définies

## 📊 Métriques à Surveiller

### Google Search Console
- Impressions
- Clics
- CTR (Click-Through Rate)
- Position moyenne
- Pages indexées
- Erreurs de crawl

### Analytics
- Taux de rebond
- Temps sur site
- Pages par session
- Taux de conversion

### Core Web Vitals
- LCP (Largest Contentful Paint) : < 2.5s
- FID (First Input Delay) : < 100ms
- CLS (Cumulative Layout Shift) : < 0.1

## 🚀 Améliorations Futures

### Recommandations
1. **Blog/Articles** : Ajouter un blog avec des articles sur l'élagage pour générer du contenu frais
2. **Avis clients structurés** : Ajouter des données structurées Review avec notes
3. **Local SEO** : Optimiser pour Google My Business
4. **Backlinks** : Stratégie de netlinking
5. **Contenu optimisé** : Enrichir le contenu avec plus de mots-clés longue traîne

## 📞 Support

Pour toute question sur le SEO du site, consultez :
- Le fichier `app/helpers/seo_helper.rb` pour la configuration
- Ce guide pour la documentation complète
- Les outils de validation mentionnés ci-dessus

---

**Dernière mise à jour** : Novembre 2024
**Version** : 2.0

