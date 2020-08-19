# frozen_string_literal: true

module UPS
  module JsonApi
    class Response
      attr_reader :body, :header, :status

      def initialize(status:, header:, body:)
        @status = Integer(status)
        @header = Header.new(header)
        @body = body
      end

      def json
        @json ||= JSON.parse(@body)
      end

      def success?
        (200..299).cover?(@header.api_http_status || @status)
      end
    end
  end
end
