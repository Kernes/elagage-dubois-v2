# Installation de Tailwind CSS localement (optionnel)

## Option 1 : Installation via npm (recommandé)
```bash
# Installer Tailwind CSS
npm install -D tailwindcss
npx tailwindcss init

# Configurer tailwind.config.js
# Compiler les styles
npx tailwindcss -i ./app/assets/stylesheets/application.css -o ./app/assets/builds/tailwind/application.css --watch
```

## Option 2 : Utiliser le CDN avec optimisations (actuel)
- ✅ Préchargement DNS
- ✅ Préconnexion
- ✅ Chargement asynchrone
- ✅ Pas d'installation supplémentaire

## Option 3 : Tailwind JIT CDN (plus rapide)
```html
<script src="https://unpkg.com/tailwindcss@3.4.0/lib/tailwind.min.js"></script>
```

## Recommandation
Gardez le CDN avec les optimisations actuelles pour :
- ✅ Simplicité de maintenance
- ✅ Mises à jour automatiques
- ✅ Pas de build process
- ✅ Chargement optimisé
