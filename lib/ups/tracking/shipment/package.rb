# frozen_string_literal: true

module UPS
  module Tracking
    class Shipment
      class Package
        include UPS::JsonApi::Entity

        attribute :tracking_number, 'TrackingNumber'

        has_many :activities, 'Activity', Activity
      end
    end
  end
end
