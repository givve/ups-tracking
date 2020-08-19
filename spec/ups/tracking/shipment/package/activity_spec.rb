# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UPS::Tracking::Shipment::Package::Activity do
  subject(:activity) { described_class.new(attributes) }

  context 'with a delivery' do
    let(:attributes) do
      {
        'ActivityLocation' => {
          'Address' => {
            'City' => 'BERKELEY',
            'PostalCode' => '69790',
            'CountryCode' => 'DE'
          },
          'Code' => 'M6',
          'Description' => 'Office',
          'SignedForByName' => 'PERKINS'
        },
        'Status' => {
          'Type' => 'D',
          'Description' => 'Delivered',
          'Code' => '9E'
        },
        'Date' => '20200813',
        'Time' => '092026'
      }
    end

    its(:location) { is_expected.to be_a(described_class::Location) }

    its(:status) { is_expected.to be_a(described_class::Status) }

    describe '#occurred_at' do
      it 'returns the correct Time value' do
        expect(activity.occurred_at(Time)).to eq(Time.new(2020, 8, 13, 9, 20, 26))
      end
    end
  end
end
