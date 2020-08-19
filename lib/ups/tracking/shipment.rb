# frozen_string_literal: true

module UPS
  module Tracking
    class Shipment
      PICKUP_DATE_FORMAT = '%Y%m%d'

      include UPS::JsonApi::Entity

      attribute :pickup_date, 'PickupDate' do |value|
        Date.strptime(value, PICKUP_DATE_FORMAT)
      end

      has_many :packages, 'Package', Package
    end
  end
end
