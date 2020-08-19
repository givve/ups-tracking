# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UPS::Tracking::Response do
  context 'when all packages of the shipment were delivered already' do
    subject(:response) do
      described_class.new(
        status: 200,
        body: fixture_file('delivered.json').read,
        header: {
          'access-control-allow-credentials' => 'true',
          'access-control-max-age' => '600',
          'apihttpstatus' => '200',
          'cache-control' => 'no-cache, no-store, must-revalidate, max-age=0, no-cache=Set-Cookie',
          'content-type' => 'application/json;charset=UTF-8',
          'date' => 'Wed, 19 Aug 2020 18:45:21 GMT',
          'pragma' => 'no-cache',
          'server' => 'Apache',
          'strict-transport-security' => 'max-age=31536000; includeSubDomains',
          'transfer-encoding' => 'chunked',
          'x-content-type-options' => 'nosniff',
          'x-frame-options' => 'SAMEORIGIN',
          'x-xss-protection' => '1; mode=block'
        }
      )
    end

    it { is_expected.to be_success }

    describe '#shipment' do
      subject(:shipment) { response.shipment }

      it { is_expected.to be_a UPS::Tracking::Shipment }
    end
  end
end
