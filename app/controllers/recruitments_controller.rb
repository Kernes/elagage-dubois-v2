class RecruitmentsController < ApplicationController
  def create
    # Récupération des données du formulaire
    application_data = {
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone: params[:phone],
      note: params[:note],
      cv_file: params[:cv_file]
    }

    # Validation des données obligatoires
    if application_data[:first_name].blank? || application_data[:last_name].blank? || 
       application_data[:email].blank? || application_data[:phone].blank?
      flash[:alert] = "Tous les champs sont obligatoires."
      redirect_to recruitment_path and return
    end

    # Validation de l'email
    unless application_data[:email].match?(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
      flash[:alert] = "L'adresse email n'est pas valide."
      redirect_to recruitment_path and return
    end

    begin
      # Validation du fichier CV
      if application_data[:cv_file].present?
        Rails.logger.info "Fichier CV reçu: #{application_data[:cv_file].original_filename} (#{application_data[:cv_file].size} bytes)"
        
        # Vérification de la taille du fichier (max 10MB)
        if application_data[:cv_file].size > 10.megabytes
          flash[:alert] = "Le fichier CV est trop volumineux (maximum 10MB)."
          redirect_to recruitment_path and return
        end
        
        # Vérification du type de fichier
        allowed_types = ['application/pdf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document']
        unless allowed_types.include?(application_data[:cv_file].content_type)
          flash[:alert] = "Format de fichier non supporté. Veuillez utiliser PDF, DOC ou DOCX."
          redirect_to recruitment_path and return
        end
      else
        Rails.logger.warn "Aucun fichier CV fourni"
      end

      # Envoi de l'email à Élagage Dubois
      RecruitmentMailer.new_application_admin(application_data).deliver_now
      
      # Envoi de l'email de confirmation au candidat
      RecruitmentMailer.new_application_confirmation(application_data).deliver_now
      
      flash[:notice] = "Votre candidature a été envoyée avec succès ! Vous allez recevoir un email de confirmation."
      redirect_to recruitment_path
    rescue => e
      Rails.logger.error "Erreur lors de l'envoi de la candidature: #{e.message}"
      Rails.logger.error e.backtrace.join("\n")
      flash[:alert] = "Une erreur est survenue lors de l'envoi de votre candidature. Veuillez réessayer."
      redirect_to recruitment_path
    end
  end
end
