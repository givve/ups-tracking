# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UPS::JsonApi::Railtie do
  let(:configuration) { UPS::JsonApi::Configuration.instance }

  before do
    allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new(environment))

    described_class.initializers.each(&:run)
  end

  context 'when used in production' do
    let(:environment) { 'production' }

    it 'sets the environment to :production' do
      expect(configuration.environment).to be :production
    end
  end

  context 'when used in development' do
    let(:environment) { 'development' }

    it 'sets the environment to :testing' do
      expect(configuration.environment).to be :testing
    end
  end

  context 'when used in test' do
    let(:environment) { 'test' }

    it 'sets the environment to :testing' do
      expect(configuration.environment).to be :testing
    end
  end
end
