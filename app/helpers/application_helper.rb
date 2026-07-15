module ApplicationHelper
  # Configuration globale de l'entreprise
  COMPANY_STATS = {
    years_experience: 10,
    satisfied_clients: 500,
    interventions: 1000,
    average_rating: 5,
    number_of_reviews: 60
  }.freeze

  COMPANY_CONTACT = {
    phone: "01 87 66 05 33",
    phone_formatted: "+33187660533",
    email: "contact@dubois-services-elagage.fr",
    reviews_url: "https://www.google.com/search?sca_esv=e5fbcc06bbcda539&rlz=1C5CHFA_enFR980FR980&si=AMgyJEtREmoPL4P1I5IDCfuA8gybfVI2d5Uj7QMwYCZHKDZ-E1F1MzApZtvA_0bqFLM5wOvxn3ttgxDbt27C6N5Z5Vpd13tsC_arYDbZA5l0FA66y6a_EAmoMgyJq4r9dQjpPG-QUbKA&q=DUBOIS+ELAGAGE+Avis&sa=X&ved=2ahUKEwj35Y_VxOiQAxVkY6QEHWWkCJ0Q0bkNegQIQhAE&biw=1186&bih=1048&dpr=0.8"
  }.freeze

  COMPANY_LEGAL = {
    name: "DUBOIS ELAGAGE",
    trade_name: "Dubois Elagage",
    brand_name: "Élagage Dubois",
    legal_form: "SASU (société par actions simplifiée unipersonnelle)",
    siren: "103 210 217",
    siret: "103 210 217 00016",
    vat_number: "FR67103210217",
    capital: "1 000,00 €",
    rcs: "103 210 217 R.C.S. Pontoise",
    president: "Jean Dubois",
    address_line: "30 Route de Pontoise",
    postal_code: "95540",
    city: "Méry-sur-Oise",
    country: "France",
    naf: "81.30Z — Services d'aménagement paysager"
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

  def company_reviews_label
    "plus de #{company_number_of_reviews} avis"
  end

  def company_reviews_url
    COMPANY_CONTACT[:reviews_url]
  end

  def company_email
    COMPANY_CONTACT[:email]
  end

  def company_legal_name
    COMPANY_LEGAL[:name]
  end

  def company_trade_name
    COMPANY_LEGAL[:trade_name]
  end

  def company_legal_form
    COMPANY_LEGAL[:legal_form]
  end

  def company_siren
    COMPANY_LEGAL[:siren]
  end

  def company_siret
    COMPANY_LEGAL[:siret]
  end

  def company_vat_number
    COMPANY_LEGAL[:vat_number]
  end

  def company_capital
    COMPANY_LEGAL[:capital]
  end

  def company_rcs
    COMPANY_LEGAL[:rcs]
  end

  def company_president
    COMPANY_LEGAL[:president]
  end

  def company_naf
    COMPANY_LEGAL[:naf]
  end

  def company_full_address
    "#{COMPANY_LEGAL[:address_line]}, #{COMPANY_LEGAL[:postal_code]} #{COMPANY_LEGAL[:city]}, #{COMPANY_LEGAL[:country]}"
  end

  def company_mail_address
    "#{company_legal_name}, #{company_full_address}"
  end
end
