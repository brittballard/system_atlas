require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  Bundler.require(:default, :assets, Rails.env)
end

module SystemAtlas
  class Application < Rails::Application
    config.assets.enabled = true
    config.assets.version = '1.0'
    config.encoding = "utf-8"
    config.filter_parameters += [:password,:password_confirmation]
    config.assets.initialize_on_precompile = false
  end
end
