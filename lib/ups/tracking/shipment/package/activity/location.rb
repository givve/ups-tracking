# frozen_string_literal: true

module UPS
  module Tracking
    class Shipment
      class Package
        class Activity
          class Location
            include UPS::JsonApi::Entity

            attribute :code, 'Code'
            attribute :description, 'Description'
            attribute :signed_for_by_name, 'SignedForByName'

            has_one :address, 'Address', Address
          end
        end
      end
    end
  end
end
