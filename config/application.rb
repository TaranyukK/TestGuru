require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application

    config.load_defaults 6.1

    config.time_zone = 'Moscow'
    config.i18n.default_locale = :ru

    config.autoload_paths += %W(#{Rails.root}/lib/clients)
  end
end
