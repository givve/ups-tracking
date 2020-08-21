# frozen_string_literal: true

require 'singleton'

require 'ups/json_api/configuration'
require 'ups/json_api/entity'
require 'ups/json_api/railtie' if defined?(Rails::Railtie)
require 'ups/json_api/response/header'
require 'ups/json_api/response'

module UPS
  module JsonApi
    class Error < StandardError; end

    def self.configure
      yield Configuration.instance
    end
  end
end
