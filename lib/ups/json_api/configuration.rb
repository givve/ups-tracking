# frozen_string_literal: true

module UPS
  module JsonApi
    class Configuration
      include Singleton

      attr_writer :access_key

      def access_key
        fail Error, "Please configure 'access_key' first." unless @access_key

        @access_key
      end
    end
  end
end
