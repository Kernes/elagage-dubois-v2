# Configuration Scalingo pour Élagage Dubois

## Variables d'environnement recommandées
RAILS_ENV=production
SECRET_KEY_BASE=<généré automatiquement par Scalingo>

## Configuration de base
- **Stack** : Ruby on Rails
- **Buildpack** : Ruby (automatique)
- **Base de données** : PostgreSQL (addon Scalingo)

## Optimisations recommandées
- **Cache** : Redis (optionnel pour les sessions)
- **CDN** : Cloudflare (recommandé)
- **SSL** : Certificat automatique Scalingo

## Monitoring
- **Logs** : Accessibles via dashboard Scalingo
- **Métriques** : CPU, RAM, requêtes
- **Alertes** : Configurables dans le dashboard

## Déploiement
```bash
# Installation de Scalingo CLI
npm install -g @scalingo/cli

# Connexion
scalingo login

# Déploiement
git push scalingo main
```

## Sécurité
- **HTTPS** : Activé automatiquement
- **Headers de sécurité** : Configurés dans Rails
- **CSP** : Content Security Policy activée
