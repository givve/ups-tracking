# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UPS::JsonApi::Configuration do
  subject(:configuration) { described_class.instance }

  describe '#access_key' do
    context 'when not previously set' do
      it 'raises an error' do
        expect { configuration.access_key }.to raise_error(UPS::JsonApi::Error, /access_key/)
      end
    end

    context 'when the value is set' do
      let(:access_key) { SecureRandom.hex }

      before do
        configuration.access_key = access_key
      end

      it 'returns the value' do
        expect(configuration.access_key).to eq access_key
      end
    end
  end

  describe '#environment' do
    context 'when not previously set' do
      it 'raises an error' do
        expect { configuration.environment }.to raise_error(UPS::JsonApi::Error, /environment/)
      end
    end

    context 'when the value is set' do
      let(:environment) { described_class::ENVIRONMENTS.sample }

      before do
        configuration.environment = environment
      end

      it 'returns the value' do
        expect(configuration.environment).to eq environment
      end
    end
  end

  describe '#environment=' do
    let(:random_environment) { SecureRandom.hex.to_sym }

    it 'accepts :testing' do
      configuration.environment = :testing

      expect(configuration.environment).to be :testing
    end

    it 'accepts :production' do
      configuration.environment = :production

      expect(configuration.environment).to be :production
    end

    it 'raises an ArgumentError for other values' do
      expect { configuration.environment = random_environment }.to raise_error(ArgumentError)
    end
  end
end
