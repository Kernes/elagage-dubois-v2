Rails.application.routes.draw do
  get "quotes/new"
  get "quotes/create"
  # Page d'accueil
  root "pages#home"

  # Pages statiques avec slugs FR
  get "qui-sommes-nous", to: "pages#about", as: :about
  get "elagage-et-etetage-darbres", to: "pages#elagage", as: :elagage
  get "abattage-darbres-de-toutes-especes", to: "pages#abattage", as: :abattage
  get "dessouchage-arbre", to: "pages#dessouchage", as: :dessouchage
  get "entretien", to: "pages#entretien", as: :entretien
  
  # Redirections 301 (permanentes) vers entretien
  get "entretien-de-jardins", to: redirect("/entretien", status: :moved_permanently)
  get "taille-de-haies", to: redirect("/entretien", status: :moved_permanently)
  get "creation-et-tonte-de-pelouse", to: redirect("/entretien", status: :moved_permanently)
  get "debroussaillage", to: redirect("/entretien", status: :moved_permanently)
  get "traitement-darbres", to: redirect("/entretien", status: :moved_permanently)
  
  # Devis et contact
  get "devis", to: "quotes#new", as: :quote
  post "devis", to: "quotes#create", as: :create_quote
  

  # Pages légales
  get "mentions-legales", to: "pages#legal_notices", as: :legal_notices
  get "cgu", to: "pages#terms_of_service", as: :terms_of_service
  get "politique-confidentialite", to: "pages#privacy_policy", as: :privacy_policy
  get "cookies", to: "pages#cookie_policy", as: :cookie_policy

  # Sitemap
  get "sitemap.xml", to: "pages#sitemap", as: :sitemap, defaults: { format: :xml }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
