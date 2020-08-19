# frozen_string_literal: true

module UPS
  module Tracking
    class Shipment
      class Package
        class Activity
          class Status
            include UPS::JsonApi::Entity

            attribute :code, 'Code'
            attribute :description, 'Description'
            attribute :type, 'Type'

            def delivered?
              type == 'D'
            end
          end
        end
      end
    end
  end
end
