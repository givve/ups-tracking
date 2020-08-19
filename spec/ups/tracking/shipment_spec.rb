# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UPS::Tracking::Shipment do
  subject(:shipment) { described_class.new(attributes) }

  context 'when all packages of the shipment were delivered already' do
    let(:attributes) { json_fixture('delivered.json').dig('TrackResponse', 'Shipment') }

    describe '#packages' do
      subject(:packages) { shipment.packages }

      it { is_expected.to all(be_a(described_class::Package)) }
    end

    describe '#pickup_date' do
      subject(:packages) { shipment.pickup_date }

      it { is_expected.to eq(Date.new(2020, 8, 12)) }
    end
  end
end
