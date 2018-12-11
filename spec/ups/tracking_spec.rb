require 'spec_helper'

RSpec.describe UPS::Tracking do
  it "has a semantic version number" do
    expect(UPS::Tracking::VERSION).to match(/\A\d+\.\d+\.\d+/)
  end
end
