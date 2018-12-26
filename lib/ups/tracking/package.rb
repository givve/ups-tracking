# frozen_string_literal: true

module UPS
  module Tracking
    # Data object encapsulating any element of +TrackResponse.Shipment[].Package+
    #
    # @author Leo Arnold
    # @since 0.1.0
    class Package
      def initialize(data)
        @data = data
      end

      def delivered?
        @data.dig('Activity', 'Status', 'Type') == 'D'
      end

      def tracking_number
        @data.dig('TrackingNumber')
      end
    end
  end
end
