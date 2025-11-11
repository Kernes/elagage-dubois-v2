class QuoteMailer < ApplicationMailer
  default from: ENV['MAILER_FROM_EMAIL'] || 'jpdubois.services@gmail.com'

  def new_quote_admin(quote)
    @quote = quote
    mail(
      to: ENV['ADMIN_EMAIL'] || 'jpdubois.services@gmail.com',
      subject: "Nouvelle demande de devis - #{@quote.full_name} - #{@quote.service_souhaite_human}"
    )
  end

  def new_quote_confirmation(quote)
    @quote = quote
    mail(
      to: @quote.email,
      subject: "Confirmation de votre demande de devis - Dubois Services"
    )
  end
end
