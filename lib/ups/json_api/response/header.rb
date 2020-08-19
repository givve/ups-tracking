# frozen_string_literal: true

module UPS
  module JsonApi
    class Response
      class Header
        def initialize(header)
          raise ArgumentError, 'Headers must be a Hash' unless header.is_a?(Hash)

          @header = header.transform_keys { |key| transform_key(key) }
        end

        def [](key)
          @header[transform_key(key)]
        end

        def api_http_status
          Integer(self['ApiHttpStatus'])
        rescue ArgumentError, TypeError
          nil
        end

        private

        def transform_key(key)
          key.downcase
        end
      end
    end
  end
end
