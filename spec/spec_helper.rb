# frozen_string_literal: true

require 'bundler/setup'
Bundler.require(:test)

FIXTURES_ROOT = Pathname.new(File.expand_path('fixtures', __dir__)).freeze

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter
]

SimpleCov.start do
  add_filter '/rakelib/'
  add_filter '/spec/'
  add_filter '/vendor/'
  minimum_coverage_by_file 95
end

require 'securerandom'

require 'ups/tracking'

Dir["#{__dir__}/helpers/*.rb"].sort.each { |file| require file }

RSpec.configure do |config|
  config.include(FixtureHelpers)

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
