# frozen_string_literal: true

require_relative 'lib/ups/tracking/version'

Gem::Specification.new do |spec|
  spec.name          = 'ups-tracking'
  spec.version       = UPS::Tracking::VERSION
  spec.authors       = ['Leo Arnold']

  spec.summary       = 'A Ruby client for the UPS shipment tracking JSON API'
  spec.homepage      = 'https://github.com/givve/ups-tracking'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir[
      'lib/**/*',
      '*.gemspec',
      '*.md',
      '*.txt'
    ] & `git ls-files -z`.split("\0")
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
