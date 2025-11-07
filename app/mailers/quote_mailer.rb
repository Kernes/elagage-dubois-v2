class QuoteMailer < ApplicationMailer
  default from: ENV['MAILER_FROM_EMAIL'] || 'sqy.etatdeslieux@gmail.com'

  def new_quote_admin(quote)
    @quote = quote
    mail(
      to: ENV['ADMIN_EMAIL'] || 'sqy.etatdeslieux@gmail.com',
      subject: "Nouvelle demande de devis - #{@quote.full_name}"
    )
  end

  def new_quote_confirmation(quote)
    @quote = quote
    mail(
      to: @quote.email,
      subject: "Confirmation de votre demande de devis - Élagage Dubois"
    )
  end
end
