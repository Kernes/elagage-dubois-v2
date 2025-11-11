class ApplicationMailer < ActionMailer::Base
  default from: ENV['MAILER_FROM'] || 'jpdubois.services@gmail.com'
  layout "mailer"
  include ApplicationHelper
end
