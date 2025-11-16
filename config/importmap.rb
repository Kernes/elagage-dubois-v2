# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

# Pin local JavaScript files
pin "gallery_modal", to: "gallery_modal.js"
pin "mobile_menu", to: "mobile_menu.js"
pin "reviews_slider", to: "reviews_slider.js"
pin "zone_intervention_map", to: "zone_intervention_map.js"
