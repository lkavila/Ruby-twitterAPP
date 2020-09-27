# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    :user_name => 'apikey',
    :password => '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',
    :domain => 'yourdomain.com',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
  }