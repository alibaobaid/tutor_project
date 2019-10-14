# spec/requests/countries_spec.rb
require 'rails_helper'

RSpec.describe 'Countries API', type: :request do
  # initialize test data 
  let(:user) { create(:user) }
  let!(:countries) { create_list(:country, 3) }
  let(:country_id) { countries.first.id }
  let(:headers) { valid_headers }


  # Test suite for GET /countries
  describe 'GET /v1/countries' do
    before { get '/v1/countries', headers: headers }

    it 'returns countries' do
      expect(json).not_to be_empty
      expect(json.size).to eq(3)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /countries/:id
  describe 'GET /v1/countries/:id' do
    before { get "/v1/countries/#{country_id}", headers: headers }

    context 'when the record exists' do
      it 'returns the country' do
        expect(json).not_to be_empty
        expect(json['country']['id']).to eq(country_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:country_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(json['error']).to match("Not Found")
      end
    end
  end

  # Test suite for POST /countries
  describe 'POST /v1/countries' do
    context 'when the request is valid' do
      valid_attributes = { country: { name: 'yemen' } }
      before { post '/v1/countries', params: valid_attributes, headers: headers }

      it 'creates a country' do
        expect(json['country']['name']).to eq('yemen')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      invalid_attributes = { country: { name: nil } }
      before { post '/v1/countries', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['error'])
          .to match("Name can't be blank")
      end
    end
  end

  # Test suite for PUT /countries/:id
  describe 'PUT /v1/countries/:id' do
    context 'when the record exists' do
      valid_attributes = { country: { name: 'sudia' } }
      before { put "/v1/countries/#{country_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(json['country']['name']).to eq('sudia')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # Test suite for DELETE /countries/:id
  describe 'DELETE /v1/countries/:id' do
    before { delete "/v1/countries/#{country_id}", headers: headers }

    it 'returns status code 200 with deleted message' do
      expect(response).to have_http_status(200)
      expect(json['message']).to \
        eq("Country deleted successfully")
    end
  end
end