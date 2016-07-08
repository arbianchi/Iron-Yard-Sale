# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Letter opener configuration
config.action_mailer.delivery_method = :letter_opener
