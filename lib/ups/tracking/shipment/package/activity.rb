# frozen_string_literal: true

module UPS
  module Tracking
    class Shipment
      class Package
        class Activity
          attr_reader :attributes

          def initialize(attributes)
            raise ArgumentError, 'Attributes must be a Hash' unless attributes.is_a?(Hash)

            @attributes = attributes
          end
        end
      end
    end
  end
end
