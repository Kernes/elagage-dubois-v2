module ApplicationHelper
  # Configuration globale de l'entreprise
  COMPANY_STATS = {
    years_experience: 10,
    satisfied_clients: 500,
    interventions: 1000,
    average_rating: 5,
    number_of_reviews: 53
  }.freeze

  COMPANY_CONTACT = {
    phone: "07 83 89 23 84",
    phone_formatted: "+33783892384",
    reviews_url: "https://www.google.com/search?sca_esv=e5fbcc06bbcda539&rlz=1C5CHFA_enFR980FR980&si=AMgyJEtREmoPL4P1I5IDCfuA8gybfVI2d5Uj7QMwYCZHKDZ-E1F1MzApZtvA_0bqFLM5wOvxn3ttgxDbt27C6N5Z5Vpd13tsC_arYDbZA5l0FA66y6a_EAmoMgyJq4r9dQjpPG-QUbKA&q=DUBOIS+SERVICES+Avis&sa=X&ved=2ahUKEwj35Y_VxOiQAxVkY6QEHWWkCJ0Q0bkNegQIQhAE&biw=1186&bih=1048&dpr=0.8"
  }.freeze

  # Helpers pour accéder aux statistiques
  def company_years_experience
    COMPANY_STATS[:years_experience]
  end

  def company_satisfied_clients
    COMPANY_STATS[:satisfied_clients]
  end

  def company_interventions
    COMPANY_STATS[:interventions]
  end

  def company_average_rating
    COMPANY_STATS[:average_rating]
  end

  def company_phone
    COMPANY_CONTACT[:phone]
  end

  def company_phone_formatted
    COMPANY_CONTACT[:phone_formatted]
  end

  def company_number_of_reviews
    COMPANY_STATS[:number_of_reviews]
  end

  def company_reviews_url
    COMPANY_CONTACT[:reviews_url]
  end
end
