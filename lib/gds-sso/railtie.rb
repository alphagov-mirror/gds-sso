module GDS
  module SSO
    class Railtie < Rails::Railtie
      initializer "gds-sso.initializer" do
        GDS::SSO.config do |config|
          config.cache = Rails.cache
          config.api_only = Rails.configuration.api_only
        end
      end
    end
  end
end
