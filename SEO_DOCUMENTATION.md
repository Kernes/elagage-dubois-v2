# Documentation SEO - Élagage Dubois

## Vue d'ensemble

Ce système SEO complet a été développé pour optimiser le référencement naturel du site Élagage Dubois. Il inclut des helpers modulaires, des données structurées, des balises meta avancées et des outils de monitoring des performances.

## Structure des Helpers SEO

### 1. SeoHelper (`app/helpers/seo_helper.rb`)
Helper principal contenant :
- Configuration SEO par défaut
- Données SEO par page
- Méthodes pour récupérer les données SEO
- Données structurées JSON-LD de base
- Méthodes utilitaires

### 2. SeoConfig (`app/helpers/seo_config.rb`)
Configuration centralisée pour :
- Balises meta par défaut
- Réseaux sociaux
- Mots-clés géographiques
- Mots-clés par service
- Configuration hreflang
- Types de données structurées
- Configuration des performances

### 3. MetaTagsHelper (`app/helpers/meta_tags_helper.rb`)
Génération des balises meta avancées :
- Balises de base
- Open Graph avancé
- Twitter Card avancé
- Géolocalisation
- Classification
- Sécurité
- Performance
- Validation

### 4. StructuredDataHelper (`app/helpers/structured_data_helper.rb`)
Données structurées avancées :
- Avis clients
- Événements
- Articles de blog
- Produits/services
- FAQ avancées
- Contacts
- Témoignages
- Prix et tarifs
- Offres d'emploi

### 5. PerformanceSeoHelper (`app/helpers/performance_seo_helper.rb`)
Optimisation des performances :
- Préchargement des ressources
- Préconnexion aux domaines
- DNS prefetch
- Optimisation des images
- Cache headers
- Compression
- Sécurité et performance
- Monitoring des performances

### 6. AdvancedSeoHelper (`app/helpers/advanced_seo_helper.rb`)
Helper avancé combinant tous les autres :
- Balises SEO complètes
- Monitoring et analytics
- Configuration avancée
- Solution SEO complète

## Utilisation

### Dans les vues
```erb
<!-- Utilisation basique -->
<%= meta_title(current_page_key) %>
<%= meta_description(current_page_key) %>
<%= meta_keywords(current_page_key) %>

<!-- Utilisation avancée -->
<%= render_complete_seo_solution(current_page_key) %>
```

### Dans le layout principal
Le layout `application.html.erb` utilise automatiquement :
- Les helpers SEO de base
- Les balises de performance
- Les données structurées
- Les balises Open Graph et Twitter

### Configuration par page
Chaque page peut définir ses propres balises SEO :
```erb
<% content_for :title, "Titre personnalisé" %>
<% content_for :description, "Description personnalisée" %>
<% content_for :keywords, "mots, clés, personnalisés" %>
<% content_for :og_title, "Titre Open Graph" %>
<% content_for :og_description, "Description Open Graph" %>
<% content_for :og_image, "https://example.com/image.jpg" %>
```

## Données structurées

### Types supportés
- LocalBusiness
- Organization
- WebSite
- Service
- FAQPage
- BreadcrumbList
- Review
- JobPosting
- ContactPage
- Product
- Event
- Article

### Utilisation
```erb
<!-- Dans une vue -->
<%= render_all_structured_data(current_page_key) %>

<!-- Données spécifiques -->
<%= structured_data_faq(faqs).to_json %>
<%= structured_data_breadcrumb(items).to_json %>
```

## Optimisations des performances

### Préchargement des ressources
- Images critiques
- CSS critiques
- JavaScript critiques
- Polices
- Pages importantes

### Préconnexion aux domaines
- Google Fonts
- CDN Tailwind
- Services d'analytics

### DNS Prefetch
- Domaines externes
- Services tiers

## Monitoring et Analytics

### Métriques surveillées
- Core Web Vitals
- Temps de chargement
- Erreurs JavaScript
- Erreurs de ressources
- Interactions utilisateur
- Performances des images
- Performances des CSS
- Performances des JavaScript

### Configuration
Décommentez les sections appropriées dans `AdvancedSeoHelper` pour activer :
- Google Analytics 4
- Google Search Console
- Bing Webmaster Tools
- Yandex Webmaster

## Configuration des pages

### Pages configurées
- **Accueil** : FAQ, avis clients, produits
- **À propos** : Témoignages, breadcrumb
- **Services** : Données de service, breadcrumb
- **Devis** : Contact, prix, breadcrumb
- **Recrutement** : Offres d'emploi, breadcrumb
- **Pages légales** : Breadcrumb

### Ajout d'une nouvelle page
1. Ajouter la configuration dans `SeoHelper::PAGE_SEO`
2. Ajouter les données structurées dans `StructuredDataHelper`
3. Configurer les balises meta dans la vue
4. Ajouter la page au sitemap

## Sitemap et Robots.txt

### Sitemap (`/sitemap.xml`)
- Généré dynamiquement
- Inclut les images
- Priorités et fréquences optimisées
- Dernière modification automatique

### Robots.txt (`/robots.txt`)
- Configuration par user-agent
- Sitemap référencé
- Délais de crawl optimisés
- Exclusion des fichiers sensibles

## Mots-clés et géolocalisation

### Zones géographiques
- Yvelines (principal)
- Paris
- Essonne
- Hauts-de-Seine

### Services
- Résidentiel
- Tertiaire
- Chiffrage locatif

### Mots-clés générés automatiquement
```ruby
SeoConfig.generate_meta_keywords(:service_residentiel, :yvelines)
# => "Élagage Dubois, état des lieux, professionnel, Île-de-France, Guyancourt, Versailles, ..."
```

## Maintenance

### Mise à jour des données
1. Modifier `SeoConfig` pour les données de base
2. Modifier `SeoHelper::PAGE_SEO` pour les pages
3. Modifier `StructuredDataHelper` pour les données structurées

### Monitoring
- Vérifier les erreurs dans la console
- Surveiller les performances
- Analyser les métriques SEO
- Tester les données structurées

## Outils de validation

### Données structurées
- [Google Rich Results Test](https://search.google.com/test/rich-results)
- [Schema.org Validator](https://validator.schema.org/)

### SEO technique
- [Google PageSpeed Insights](https://pagespeed.web.dev/)
- [GTmetrix](https://gtmetrix.com/)
- [WebPageTest](https://www.webpagetest.org/)

### Balises meta
- [Facebook Sharing Debugger](https://developers.facebook.com/tools/debug/)
- [Twitter Card Validator](https://cards-dev.twitter.com/validator)
- [LinkedIn Post Inspector](https://www.linkedin.com/post-inspector/)

## Bonnes pratiques

### Mise à jour régulière
- Vérifier les données structurées
- Mettre à jour le sitemap
- Optimiser les performances
- Surveiller les erreurs

### Contenu
- Titres uniques et descriptifs
- Descriptions optimisées
- Mots-clés pertinents
- Images optimisées

### Technique
- URLs canoniques
- Balises hreflang
- Données structurées valides
- Performances optimisées

## Support

Pour toute question ou problème avec le système SEO :
1. Vérifier la console pour les erreurs
2. Tester les données structurées
3. Valider les balises meta
4. Consulter cette documentation

---

**Note** : Ce système SEO est conçu pour être évolutif et facilement maintenable. N'hésitez pas à l'adapter selon vos besoins spécifiques.
