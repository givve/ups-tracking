# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UPS::Tracking::Shipment::Package do
  subject(:package) { described_class.new(attributes) }

  context 'when all packages of the shipment were delivered already' do
    let(:attributes) { json_fixture('delivered.json').dig('TrackResponse', 'Shipment', 'Package') }

    its(:activities) { is_expected.to all(be_a(described_class::Activity)) }

    its(:delivery) { is_expected.to be_a(described_class::Activity) }

    it { is_expected.to be_delivered }

    its(:tracking_number) { is_expected.to eq('1Z44901G2210228734') }
  end
end
