# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UPS::JsonApi::Response::Header do
  subject(:header) { described_class.new(attributes) }

  let(:attributes) { {} }

  describe '#[]' do
    context 'when the requested header is present' do
      let(:attributes) { { 'X-Frame-Options' => 'SAMEORIGIN' } }

      it 'returns the value independent of key case' do
        expect(header['X-FRAME-OPTIONS']).to eq(attributes['X-Frame-Options'])
      end
    end

    context 'when the requested header is absent' do
      it 'returns nil' do
        expect(header['X-FRAME-OPTIONS']).to be nil
      end
    end
  end

  describe '#api_http_status' do
    context 'when the header value is wellformed' do
      let(:attributes) { { 'ApiHttpStatus' => '200' } }

      it 'returns the value as Integer' do
        expect(header.api_http_status).to be 200
      end
    end

    context 'when the header value is malformed' do
      let(:attributes) { { 'ApiHttpStatus' => 'true' } }

      it 'returns nil' do
        expect(header.api_http_status).to be nil
      end
    end

    context 'when the header key is absent' do
      let(:attributes) { {} }

      it 'returns nil' do
        expect(header.api_http_status).to be nil
      end
    end
  end
end
