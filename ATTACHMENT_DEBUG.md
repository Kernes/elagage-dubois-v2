# Debug des Attachments Email - Élagage Dubois

## Problème
Les fichiers CV ne sont pas reçus en production via email.

## Solutions Implémentées

### 1. Attachement Correct dans le Mailer
```ruby
# Dans recruitment_mailer.rb
if @cv_file.present?
  attachments[@cv_file.original_filename] = @cv_file.read
end
```

### 2. Validation Renforcée dans le Contrôleur
- Vérification de la présence du fichier
- Validation de la taille (max 10MB)
- Validation du type MIME
- Logging détaillé

### 3. Gestion d'Erreurs Améliorée
- Logs détaillés pour le debugging
- Gestion des erreurs d'attachement
- Messages d'erreur spécifiques

## Vérifications à Faire en Production

### 1. Logs de l'Application
```bash
# Vérifier les logs Scalingo
scalingo logs --app elagage-dubois-v2

# Chercher ces messages :
# "Fichier CV reçu: filename.pdf (12345 bytes)"
# "Attachement du fichier CV: filename.pdf"
# "Fichier CV attaché avec succès"
```

### 2. Configuration SMTP
Vérifier que ces variables d'environnement sont définies :
- `SMTP_ADDRESS`
- `SMTP_PORT`
- `SMTP_DOMAIN`
- `SMTP_USERNAME`
- `SMTP_PASSWORD`
- `SMTP_AUTHENTICATION`
- `SMTP_ENABLE_STARTTLS`

### 3. Test de l'Email
```ruby
# Dans la console Rails en production
rails console

# Tester l'envoi d'un email avec attachment
file = File.open("test.pdf", "rb")
application_data = {
  first_name: "Test",
  last_name: "User",
  email: "test@example.com",
  phone: "0123456789",
  address: "Test Address",
  note: "Test note",
  cv_file: file
}

RecruitmentMailer.new_application_admin(application_data).deliver_now
```

## Causes Possibles

### 1. Limitation du Fournisseur SMTP
- Certains fournisseurs limitent la taille des attachments
- Gmail : 25MB max
- Outlook : 20MB max
- Vérifier les limites de votre fournisseur SMTP

### 2. Configuration SMTP Incorrecte
- Authentification manquante
- Port incorrect
- TLS/SSL mal configuré

### 3. Problème de Mémoire
- Fichiers trop volumineux
- Limitation mémoire Scalingo

### 4. Filtres Anti-Spam
- Certains emails avec attachments sont bloqués
- Vérifier les logs du serveur SMTP

## Solutions Alternatives

### 1. Upload vers un Service Cloud
```ruby
# Utiliser Active Storage avec AWS S3 ou Google Cloud
# Puis envoyer un lien de téléchargement dans l'email
```

### 2. Compression du Fichier
```ruby
# Compresser le PDF avant l'envoi
require 'zip'
```

### 3. Service d'Email Spécialisé
- SendGrid
- Mailgun
- Amazon SES
- Plus fiables pour les attachments

## Commandes de Debug

### Vérifier la Configuration
```bash
# Dans la console Rails
Rails.application.config.action_mailer.smtp_settings
```

### Tester l'Envoi
```bash
# Envoyer un email de test
rails runner "RecruitmentMailer.test_email.deliver_now"
```

### Vérifier les Logs
```bash
# Logs en temps réel
scalingo logs --app elagage-dubois-v2 --follow
```

## Prochaines Étapes

1. **Vérifier les logs** après déploiement
2. **Tester avec un petit fichier** (< 1MB)
3. **Vérifier la configuration SMTP**
4. **Considérer un service d'email spécialisé** si le problème persiste
