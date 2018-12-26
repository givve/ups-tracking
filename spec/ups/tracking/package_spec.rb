# frozen_string_literal: true

RSpec.describe UPS::Tracking::Package do
  describe 'fixture file packages/delivered.json' do
    subject(:package) { described_class.new(delivered_package) }

    let(:delivered_package) { JSON.parse(fixture_file('packages/delivered.json').read) }

    describe '.new' do
      it 'does not raise an error' do
        expect { package }.not_to raise_error
      end
    end

    describe '#delivered?' do
      it 'returns true' do
        expect(package.delivered?).to be true
      end
    end

    describe '#tracking_number' do
      it 'returns the value of TrackingNumber' do
        expect(package.tracking_number).to eq('1Z12345E6692804405')
      end
    end
  end
end
