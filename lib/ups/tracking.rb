# frozen_string_literal: true

require 'ups/json_api'

require 'ups/tracking/fault'
require 'ups/tracking/shipment/package/activity'
require 'ups/tracking/shipment/package'
require 'ups/tracking/shipment'
require 'ups/tracking/response'
require 'ups/tracking/version'

module UPS
  module Tracking
    class Error < StandardError; end
    # Your code goes here...
  end
end
