require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsSimpleLogin
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Railsアプリのデフォルトタイムゾーン
    config.time_zone = 'Tokyo'

    # SCSS、CoffeeScript、ControllerとViewのSpecファイルを自動生成しない設定
    # テストフレームワークをRspecに変更
    config.generators do |g|
      g.helper false
      g.assets false
      g.test_framework :rspec
      g.controller_specs false
      g.view_specs false
    end
  end
end
