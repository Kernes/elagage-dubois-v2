# Configuration spécifique pour Scalingo
Rails.application.configure do
  # Force le mode production
  config.force_ssl = true
  
  # Logs vers stdout
  config.logger = Logger.new(STDOUT)
  config.log_level = :info
  
  # Assets
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  
  # Cache - utiliser memory store au lieu de solid_cache
  config.cache_store = :memory_store
  
  # Active Job - utiliser async adapter au lieu de solid_queue
  config.active_job.queue_adapter = :async
  
  # Action Cable - désactiver au lieu de solid_cable
  config.action_cable.disable_request_forgery_protection = true
  
  # Mail
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
end
