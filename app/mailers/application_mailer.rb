class ApplicationMailer < ActionMailer::Base
  default from: "orders@gymrek.com"
  layout 'mailer'
end
