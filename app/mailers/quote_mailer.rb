class QuoteMailer < ApplicationMailer
  default from: ENV['MAILER_FROM_EMAIL'] || ApplicationHelper::COMPANY_CONTACT[:email]

  def new_quote_admin(quote)
    @quote = quote
    mail(
      to: ENV['ADMIN_EMAIL'] || ApplicationHelper::COMPANY_CONTACT[:email],
      subject: "Nouvelle demande de devis - #{@quote.full_name} - #{@quote.service_souhaite_human}"
    )
  end

  def new_quote_confirmation(quote)
    @quote = quote
    mail(
      to: @quote.email,
      subject: "Confirmation de votre demande de devis - Dubois Elagage"
    )
  end
end
