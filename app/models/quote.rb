class Quote
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations
  
  # Définir les attributs
  attribute :prenom, :string
  attribute :nom, :string
  attribute :email, :string
  attribute :telephone, :string
  attribute :service_souhaite, :string
  attribute :commentaires, :string
  attribute :rgpd_accepted, :boolean
  
  # Validations
  validates :prenom, presence: true
  validates :nom, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :telephone, presence: true
  validates :service_souhaite, presence: true
  validates :commentaires, presence: true
  validates :rgpd_accepted, acceptance: { message: "doit être accepté" }

  # Méthodes personnalisées
  def full_name
    "#{prenom} #{nom}"
  end

  def service_souhaite_human
    case service_souhaite
    when 'elagage'
      'Élagage'
    when 'abattage'
      'Abattage'
    when 'dessouchage'
      'Dessouchage'
    when 'entretien'
      'Entretien de jardin'
    when 'taille_haies'
      'Taille de haies'
    when 'tonte_pelouse'
      'Création et tonte de pelouse'
    when 'debroussaillage'
      'Débroussaillage'
    when 'autre'
      'Autre'
    else
      service_souhaite.humanize
    end
  end
  
  # Simuler la méthode save pour la compatibilité avec le contrôleur
  def save
    if valid?
      # Simuler une sauvegarde réussie (sans base de données)
      true
    else
      false
    end
  end
  
  # Simuler l'ID pour la compatibilité avec les emails
  def id
    @id ||= SecureRandom.uuid
  end
  
  # Simuler created_at pour la compatibilité avec les emails
  def created_at
    @created_at ||= Time.current
  end
  
  # Simuler updated_at pour la compatibilité avec les emails
  def updated_at
    @updated_at ||= Time.current
  end
end
