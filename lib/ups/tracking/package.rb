# frozen_string_literal: true

module UPS
  module Tracking
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
