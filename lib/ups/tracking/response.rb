# frozen_string_literal: true

module UPS
  module Tracking
    class Response < UPS::JsonApi::Response
      def attributes
        json['TrackResponse']
      end

      def shipment
        @shipment ||= Shipment.new(attributes['Shipment'])
      end
    end
  end
end
