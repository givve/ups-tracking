# frozen_string_literal: true

module UPS
  module Tracking
    class Shipment
      class Package
        class Activity
          DATE_FORMAT = '%Y%m%d'
          TIME_FORMAT = '%H%M%S'

          include UPS::JsonApi::Entity

          attribute :date, 'Date'
          attribute :time, 'Time'

          has_one :location, 'ActivityLocation', Location
          has_one :status, 'Status', Status

          def occurred_at(timezone)
            timezone.strptime("#{date} #{time}", "#{DATE_FORMAT} #{TIME_FORMAT}").utc
          end
        end
      end
    end
  end
end
