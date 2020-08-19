# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UPS::Tracking::Shipment do
  subject(:shipment) { described_class.new(attributes) }

  context 'when all packages of the shipment were delivered already' do
    let(:attributes) { json_fixture('delivered.json').dig('TrackResponse', 'Shipment') }

    its(:packages) { is_expected.to all(be_a(described_class::Package)) }

    its(:pickup_date) { is_expected.to eq(Date.new(2020, 8, 12)) }
  end
end
