class ApplicationMailer < ActionMailer::Base
  default from: ENV['MAILER_FROM'] || 'sqy.etatdeslieux@gmail.com'
  layout "mailer"
end
