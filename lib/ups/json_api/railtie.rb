# frozen_string_literal: true

module UPS
  module JsonApi
    class Railtie < Rails::Railtie
      initializer 'ups-json_api.set_environment' do
        UPS::JsonApi.configure do |config|
          config.environment = Rails.env.production? ? :production : :testing
        end
      end
    end
  end
end
