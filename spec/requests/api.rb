require 'rails_helper'

describe Monitoring::API do
  describe 'POST /api/logs' do
    it 'returns 201 created' do
      post '/api/logs', {log: attributes_for(:log)}.to_json, { 'Content-Type' => 'application/json' }
      expect(response.status).to eq 201
    end
  end
end