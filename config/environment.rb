# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# ActionMailer::Base.delivery_method = :smtp
# ActionMailer::Base.perform_deliveries = true
# ActionMailer::Base.smtp_settings = {
#   address: 'smtp.gmail.com',
#   port: 465,
#   domain: ENV['gmail.com'],
#   user_name: ENV['otipuebi@gmail.com'],
#   password: ENV['Oracle@1'],
#   authentication: 'plain',
#   :ssl => true,
#   :tls => true,
#   enable_starttls_auto: true
#  }