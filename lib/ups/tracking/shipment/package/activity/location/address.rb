# frozen_string_literal: true

module UPS
  module Tracking
    class Shipment
      class Package
        class Activity
          class Location
            class Address
              include UPS::JsonApi::Entity

              attribute :city, 'City'
              attribute :postal_code, 'PostalCode'
              attribute :country_code, 'CountryCode'
            end
          end
        end
      end
    end
  end
end
