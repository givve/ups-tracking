# frozen_string_literal: true

module UPS
  module Tracking
    class Shipment
      class Package
        ACTIVITIES_KEY = 'Activity'

        attr_reader :attributes

        def initialize(attributes)
          raise ArgumentError, 'Attributes must be a Hash' unless attributes.is_a?(Hash)

          @attributes = attributes
        end

        def activities
          return unless attributes.key?(ACTIVITIES_KEY)

          @activities ||= [attributes[ACTIVITIES_KEY]].flatten.compact.map { |attributes| Activity.new(attributes) }
        end

        def tracking_number
          attributes['TrackingNumber']
        end
      end
    end
  end
end
