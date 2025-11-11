class QuotesController < ApplicationController
  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      # Envoyer les emails
      QuoteMailer.new_quote_admin(@quote).deliver_now
      QuoteMailer.new_quote_confirmation(@quote).deliver_now

      # Message de succès et redirection
      flash[:success] = "Votre demande de devis a été envoyée avec succès ! Vous recevrez votre devis dans les 24 heures."
      redirect_to quote_path, notice: "Votre demande de devis a été envoyée avec succès !"
    else
      # En cas d'erreur, afficher le formulaire avec les erreurs
      flash.now[:error] = "Il y a eu une erreur dans votre formulaire. Veuillez vérifier les champs marqués en rouge."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def quote_params
    params.require(:quote).permit(
      :prenom, :nom, :email, :telephone, :service_souhaite, :commentaires, :rgpd_accepted
    )
  end
end
