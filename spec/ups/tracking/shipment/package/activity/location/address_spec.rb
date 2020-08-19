# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UPS::Tracking::Shipment::Package::Activity::Location::Address do
  subject(:address) { described_class.new(attributes) }

  let(:attributes) do
    {
      'City' => 'BERKELEY',
      'PostalCode' => '69790',
      'CountryCode' => 'DE'
    }
  end

  its(:city) { is_expected.to eq 'BERKELEY' }

  its(:postal_code) { is_expected.to eq '69790' }

  its(:country_code) { is_expected.to eq 'DE' }
end
