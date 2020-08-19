# frozen_string_literal: true

module UPS
  module Tracking
    class Response < UPS::JsonApi::Response
      ATTRIBUTES_KEY = 'TrackResponse'
      FAULT_KEY = 'Fault'
      SHIPMENT_KEY = 'Shipment'

      def attributes
        json&.dig(ATTRIBUTES_KEY) || json
      end

      def fault
        return nil unless attributes.key?(FAULT_KEY)

        @fault ||= Fault.new(attributes[FAULT_KEY])
      end

      def shipment
        return nil unless attributes.key?(SHIPMENT_KEY)

        @shipment ||= Shipment.new(attributes[SHIPMENT_KEY])
      end
    end
  end
end
