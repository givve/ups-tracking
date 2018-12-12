# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'ups/tracking/version'

Gem::Specification.new do |spec| # rubocop:disable Metrics/BlockLength
  spec.name          = 'ups-tracking'
  spec.version       = UPS::Tracking::VERSION
  spec.authors       = ['Leo Arnold']

  spec.summary       = 'A Ruby client for the UPS shipment tracking JSON-API'
  spec.homepage      = 'https://github.com/givve/ups-tracking'
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata['source_code_uri'] = 'https://github.com/givve/ups-tracking'
    spec.metadata['changelog_uri'] = 'https://github.com/givve/ups-tracking/blob/master/CHANGELOG.md'
    spec.metadata['yard.run'] = 'yri'
  end

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir[
      'lib/**/*',
      '*.gemspec',
      '*.md',
      '*.txt'
    ]
  end
  spec.require_paths = ['lib']

  spec.required_ruby_version = '~> 2.4'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'inch', '~> 0.8'
  spec.add_development_dependency 'overcommit', '~> 0.46'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.61'
  spec.add_development_dependency 'simplecov', '~> 0.10'
  spec.add_development_dependency 'yard', '~> 0.9'
end
