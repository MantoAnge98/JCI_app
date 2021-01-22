require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module JCIApp
  class Application < Rails::Application
    config.load_defaults 5.2
  
    config.i18n.default_locale = :fr
    config.exceptions_app = self.routes
    config.assets.initialize_on_precompile = false
  end
end
