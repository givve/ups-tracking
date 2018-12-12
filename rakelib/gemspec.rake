# frozen_string_literal: true

namespace :gemspec do
  desc 'List all files included in ups-tracking.gem'
  task :files do
    spec = Gem::Specification.find_by_name('ups-tracking')

    puts spec.files
  end
end
