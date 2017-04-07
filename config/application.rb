require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module Mistonache
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.



    config.time_zone = 'Kyiv'
    config.i18n.default_locale = :uk
    config.autoload_paths += %w(#{config.root}/app/models/ckeditor)
    config.assets.precompile += Ckeditor.assets
  end
end
