# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UPS::Tracking::Shipment::Package::Activity::Status do
  subject(:status) { described_class.new(attributes) }

  let(:attributes) do
    {
      'Type' => 'D',
      'Description' => 'Delivered',
      'Code' => '9E'
    }
  end

  its(:code) { is_expected.to eq '9E' }

  its(:description) { is_expected.to eq 'Delivered' }

  its(:type) { is_expected.to eq 'D' }
end
