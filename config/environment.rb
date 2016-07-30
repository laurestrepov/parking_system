# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

#config.action_mailer.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :user_name => 'lau.restrepo.v',
  :password => '<3nomelase1991',
  :domain => 'place-yo-wheels.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
