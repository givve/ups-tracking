# frozen_string_literal: true

require 'bundler/setup'
Bundler.require(:development)

require 'simplecov'
require 'simplecov_json_formatter'

SimpleCov.start do
  add_filter '/rakelib/'
  add_filter '/spec/'
  add_filter '/vendor/'
  minimum_coverage_by_file 95
end
SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new(
  [SimpleCov::Formatter::JSONFormatter,
   SimpleCov::Formatter::HTMLFormatter]
)

FIXTURES_ROOT = Pathname.new(File.expand_path('fixtures', __dir__)).freeze

require 'securerandom'

require 'ups/tracking'

Dir["#{__dir__}/helpers/*.rb"].each { |file| require file }

RSpec.configure do |config|
  config.include(FixtureHelpers)

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
