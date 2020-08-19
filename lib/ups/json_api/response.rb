# frozen_string_literal: true

module UPS
  module JsonApi
    class Response
      attr_reader :status

      def initialize(status:, header:, body:)
        @status = Integer(status)
        @header = header
        @body = body
      end

      def json
        @json ||= JSON.parse(@body)
      end

      def success?
        (200..299).cover?(@status)
      end
    end
  end
end
