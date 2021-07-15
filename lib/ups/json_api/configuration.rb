# frozen_string_literal: true

module UPS
  module JsonApi
    class Configuration
      include Singleton

      ENVIRONMENTS = [:production, :testing].freeze

      attr_writer :access_key

      [:access_key, :environment].each do |method|
        define_method(method) do
          value = instance_variable_get("@#{method}".to_sym)

          fail Error, "Please configure '#{method}' first." if value.nil?

          value
        end
      end

      def environment=(value)
        fail ArgumentError, "Unknown environment '#{value.inspect}'" unless ENVIRONMENTS.include?(value)

        @environment = value
      end
    end
  end
end
