require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LangtrainerBackend
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :en

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.i18n.available_locales = [:en, :ru]

    config.x.host = 'training.langtrainer.com'
    config.x.root_url = "http://#{config.x.host}"

    default_url_options = { host: config.x.host }

    routes.default_url_options = default_url_options
    config.action_mailer.default_url_options = default_url_options
    config.action_controller.default_url_options = default_url_options

    ActionMailer::Base.default from: "\"Langtrainer\" <noreply@langtrainer.com>"

    config.action_dispatch.default_headers = {
      'Access-Control-Allow-Headers' => 'X-Requested-With',
      'Access-Control-Allow-Origin' => '*',
      'Access-Control-Request-Method' => '*'
    }
  end
end
