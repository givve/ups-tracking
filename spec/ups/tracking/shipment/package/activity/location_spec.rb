# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UPS::Tracking::Shipment::Package::Activity::Location do
  subject(:location) { described_class.new(attributes) }

  let(:attributes) do
    {
      'Address' => {
        'City' => 'BERKELEY',
        'PostalCode' => '69790',
        'CountryCode' => 'DE'
      },
      'Code' => 'M6',
      'Description' => 'Office',
      'SignedForByName' => 'PERKINS'
    }
  end

  its(:address) { is_expected.to be_a(described_class::Address) }

  its(:code) { is_expected.to eq 'M6' }

  its(:description) { is_expected.to eq 'Office' }

  its(:signed_for_by_name) { is_expected.to eq 'PERKINS' }
end
