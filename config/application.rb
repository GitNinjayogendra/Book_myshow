require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OnlineTicketBooking
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    #config.time_zone = "Kolkata"
    #config.time_zone = Time.now.zone
    #config.time_zone = "Singapore"
    # config.eager_load_paths << Rails.root.join("extras")
  #config.action_mailer.delivery_method = :smtp
  # config.action_mailer.default_url_options = { host: 'http://localhost:4000/' }
  # SMTP settings for gmail

  end
end
