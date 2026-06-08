class ApplicationMailer < ActionMailer::Base
  default from: ENV['MAILER_FROM'] || ApplicationHelper::COMPANY_CONTACT[:email]
  layout "mailer"
  include ApplicationHelper
end
