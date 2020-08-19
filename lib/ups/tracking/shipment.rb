# frozen_string_literal: true

module UPS
  module Tracking
    class Shipment
      PICKUP_DATE_KEY = 'PickupDate'
      PICKUP_DATE_FORMAT = '%Y%m%d'
      PACKAGES_KEY = 'Package'

      attr_reader :attributes

      def initialize(attributes)
        raise ArgumentError, 'Attributes must be a Hash' unless attributes.is_a?(Hash)

        @attributes = attributes
      end

      def packages
        return unless attributes.key?(PACKAGES_KEY)

        @packages ||= [attributes[PACKAGES_KEY]].flatten.compact.map { |attributes| Package.new(attributes) }
      end

      def pickup_date
        return unless attributes.key?(PICKUP_DATE_KEY)

        Date.strptime(attributes[PICKUP_DATE_KEY], PICKUP_DATE_FORMAT)
      end
    end
  end
end
