class Quote
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations
  
  # Définir les attributs
  attribute :prenom, :string
  attribute :nom, :string
  attribute :email, :string
  attribute :telephone, :string
  attribute :type_etat, :string
  attribute :type_bien, :string
  attribute :surface, :decimal
  attribute :pieces, :integer
  attribute :adresse, :string
  attribute :ville, :string
  attribute :code_postal, :string
  attribute :commentaires, :string
  attribute :rgpd_accepted, :boolean
  
  # Validations
  validates :prenom, presence: true
  validates :nom, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :type_etat, presence: true, inclusion: { in: %w[entree sortie] }
  validates :type_bien, presence: true
  validates :surface, presence: true, numericality: { greater_than: 0 }
  validates :pieces, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 10 }
  validates :adresse, presence: true
  validates :ville, presence: true
  validates :code_postal, presence: true, format: { with: /\A\d{5}\z/ }
  validates :rgpd_accepted, acceptance: { message: "doit être accepté" }

  # Méthodes personnalisées
  def full_name
    "#{prenom} #{nom}"
  end

  def type_etat_human
    case type_etat
    when 'entree'
      'État des lieux d\'entrée'
    when 'sortie'
      'État des lieux de sortie'
    end
  end

  def type_bien_human
    case type_bien
    when 'maison'
      'Maison individuelle'
    when 'appartement'
      'Appartement'
    when 'studio'
      'Studio'
    when 'loft'
      'Loft'
    else
      type_bien.humanize
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
