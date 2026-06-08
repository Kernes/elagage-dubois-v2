# Variables d'environnement

## Configuration des emails

- `MAILER_FROM_EMAIL` : Email d'expéditeur (défaut: contact@dubois-services-elagage.fr)
- `ADMIN_EMAIL` : Email qui reçoit les demandes de devis (défaut: contact@dubois-services-elagage.fr)

## Configuration SMTP (optionnel)

- `SMTP_ADDRESS` : Serveur SMTP
- `SMTP_USERNAME` : Nom d'utilisateur SMTP
- `SMTP_PASSWORD` : Mot de passe SMTP
- `SMTP_DOMAIN` : Domaine SMTP
- `SMTP_PORT` : Port SMTP (défaut: 587)
- `SMTP_AUTHENTICATION` : Type d'authentification (défaut: plain)
- `SMTP_ENABLE_STARTTLS` : Activer STARTTLS (défaut: true)

## Configuration de l'application

- `APP_HOST` : Host de l'application (défaut: dubois-services-elagage.fr)
- `RAILS_LOG_LEVEL` : Niveau de log (défaut: info)

## Configuration sur Scalingo

Pour configurer ces variables sur Scalingo :

```bash
# Email de destination des devis
scalingo env-set ADMIN_EMAIL="contact@dubois-services-elagage.fr"

# Email d'expéditeur
scalingo env-set MAILER_FROM_EMAIL="contact@dubois-services-elagage.fr"

# Configuration SMTP (si nécessaire)
scalingo env-set SMTP_ADDRESS="smtp.gmail.com"
scalingo env-set SMTP_USERNAME="votre-email@gmail.com"
scalingo env-set SMTP_PASSWORD="votre-mot-de-passe-app"
scalingo env-set SMTP_DOMAIN="gmail.com"
```
