# frozen_string_literal: true

module UPS
  module Tracking
    class Shipment
      attr_reader :attributes

      def initialize(attributes)
        @attributes = attributes
      end
    end
  end
end
