# spec/requests/levels_spec.rb
require 'rails_helper'

RSpec.describe 'Levels API', type: :request do
  # initialize test data
  let(:user) { create(:user) }
  let!(:levels) { create_list(:level, 3) }
  let(:level_id) { levels.first.id }
  let(:headers) { valid_headers }


  # Test suite for GET /levels
  describe 'GET /v1/levels' do
    before { get '/v1/levels', headers: headers }

    it 'returns levels' do
      expect(json).not_to be_empty
      expect(json.size).to eq(3)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /levels/:id
  describe 'GET /v1/levels/:id' do
    before { get "/v1/levels/#{level_id}", headers: headers }

    context 'when the record exists' do
      it 'returns the level' do
        expect(json).not_to be_empty
        expect(json['level']['id']).to eq(level_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:level_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(json['error']).to match("Not Found")
      end
    end
  end

  # Test suite for POST /levels
  describe 'POST /v1/levels' do
    context 'when the request is valid' do
      valid_attributes = { level: { name: 'daploma' } }
      before { post '/v1/levels', params: valid_attributes, headers: headers }

      it 'creates a level' do
        expect(json['level']['name']).to eq('daploma')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      invalid_attributes = { level: { name: nil } }
      before { post '/v1/levels', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['error'])
          .to match("Name can't be blank")
      end
    end
  end

  # Test suite for PUT /levels/:id
  describe 'PUT /v1/levels/:id' do
    context 'when the record exists' do
      valid_attributes = { level: { name: 'doctor' } }
      before { put "/v1/levels/#{level_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(json['level']['name']).to eq('doctor')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # Test suite for DELETE /levels/:id
  describe 'DELETE /v1/levels/:id' do
    before { delete "/v1/levels/#{level_id}", headers: headers }

    it 'returns status code 200 with deleted message' do
      expect(response).to have_http_status(200)
      expect(json['message']).to \
        eq("Level deleted successfully")
    end
  end
end