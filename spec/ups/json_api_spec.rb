# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UPS::JsonApi do
  subject(:api) { described_class }

  describe '.configure' do
    let(:configuration) { UPS::JsonApi::Configuration.instance }

    context 'when modifying the access_key' do
      let(:access_key) { SecureRandom.hex }

      it 'changes the access_key' do
        expect do
          described_class.configure do |config|
            config.access_key = access_key
          end
        end.to change { configuration.access_key }.to(access_key)
      end
    end
  end
end
