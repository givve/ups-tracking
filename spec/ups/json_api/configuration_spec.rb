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
end
