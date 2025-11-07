class RecruitmentMailer < ApplicationMailer
  # Email envoyé à Élagage Dubois pour notifier une nouvelle candidature
  def new_application_admin(application_data)
    @first_name = application_data[:first_name]
    @last_name = application_data[:last_name]
    @email = application_data[:email]
    @phone = application_data[:phone]
    @note = application_data[:note]
    @cv_file = application_data[:cv_file]

    # Attacher le fichier CV si présent
    if @cv_file.present?
      begin
        Rails.logger.info "Attachement du fichier CV: #{@cv_file.original_filename}"
        attachments[@cv_file.original_filename] = @cv_file.read
        Rails.logger.info "Fichier CV attaché avec succès"
      rescue => e
        Rails.logger.error "Erreur lors de l'attachement du CV: #{e.message}"
        # On continue même si l'attachement échoue
      end
    else
      Rails.logger.warn "Aucun fichier CV à attacher"
    end

    mail(
      to: ENV['ADMIN_EMAIL'] || 'sqy.etatdeslieux@gmail.com',
      subject: "Nouvelle candidature - #{@first_name} #{@last_name}",
      reply_to: @email
    ) do |format|
      format.html
      format.text
    end
  end

  # Email de confirmation envoyé au candidat
  def new_application_confirmation(application_data)
    @first_name = application_data[:first_name]
    @last_name = application_data[:last_name]
    @email = application_data[:email]

    mail(
      to: @email,
      subject: "Confirmation de candidature - Élagage Dubois"
    ) do |format|
      format.html
      format.text
    end
  end
end
