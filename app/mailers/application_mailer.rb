class ApplicationMailer < ActionMailer::Base
  include Roadie::Rails::Automatic
  default from: "In Bed With Betty <hello@inbedwithbetty.com>"
  layout 'mailer'
end
