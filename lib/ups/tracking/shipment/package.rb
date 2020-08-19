# frozen_string_literal: true

module UPS
  module Tracking
    class Shipment
      class Package
        include UPS::JsonApi::Entity

        attribute :tracking_number, 'TrackingNumber'

        has_many :activities, 'Activity', Activity

        def delivery
          @delivery ||= activities.detect { |activity| activity.status&.delivered? }
        end

        def delivered?
          !delivery.nil?
        end
      end
    end
  end
end
