require_relative "boot"

require "rails/all"
require 'dotenv/load'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Minkatsu
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    if Rails.env.development? || Rails.env.test?
      Dotenv.load
    end    
  end
end

require_relative "boot"

require "rails/all"
require 'dotenv/load' # dotenvの読み込み

Bundler.require(*Rails.groups)

module Minkatsu
  class Application < Rails::Application
    config.load_defaults 6.1

    # dotenvの読み込みが必要です
    # load_dotenvの代わりにloadを使うことで成功する環境があります
    # どちらでも問題ありません
    if Rails.env.development? || Rails.env.test?
      Dotenv.load
    end
  end
end