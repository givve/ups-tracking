RSpec.describe Ups::Tracking do
  it "has a semantic version number" do
    expect(Ups::Tracking::VERSION).to match /\A\d+\.\d+\.\d+/
  end
end
