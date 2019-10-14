require 'rails_helper'

RSpec.describe 'Cities API' do
  let(:user) { create(:user) }
  let!(:country) { create(:country) }
  let!(:cities) { create_list(:city, 3, country_id: country.id) }
  let(:country_id) { country.id }
  let(:id) { cities.first.id }
  let(:headers) { valid_headers }


  # Test suite for GET /countries/:country_id/cities
  describe 'GET /v1/countries/:country_id/cities' do
    before { get "/v1/countries/#{country_id}/cities", headers: headers }

    context 'when country exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all country cities' do
        expect(json.size).to eq(3)
      end
    end

    context 'when country does not exist' do
      let(:country_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(json['error']).to match("City not found!")
      end
    end
  end

  # Test suite for GET /countries/:country_id/cities/:id
  describe 'GET /v1/countries/:country_id/cities/:id' do
    before { get "/v1/countries/#{country_id}/cities/#{id}", headers: headers }

    context 'when country city exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the city' do
        expect(json['city']['id']).to eq(id)
      end
    end

    context 'when country city does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(json['error']).to match("Not Found")
      end
    end
  end

  # Test suite for PUT /countries/:country_id/cities
  describe 'POST /v1/countries/:country_id/cities' do
    valid_attributes = { city: { name: 'Visit Narnia' } }

    context 'when request attributes are valid' do
      before { post "/v1/countries/#{country_id}/cities", params: valid_attributes, headers: headers }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      invalid_attributes = { city: { name: nil } }
      before { post "/v1/countries/#{country_id}/cities", params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(json['error']).to match("Name can't be blank")
      end
    end
  end

  # Test suite for PUT /countries/:country_id/cities/:id
  describe 'PUT /v1/countries/:country_id/cities/:id' do
    valid_attributes = { city: { name: 'Mozart' } }
    
    before { put "/v1/countries/#{country_id}/cities/#{id}", params: valid_attributes, headers: headers }

    context 'when city exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'updates the city' do
        updated_city = City.find(id)
        expect(updated_city.name).to match("Mozart")
      end
    end
  end

  # Test suite for DELETE /countries/:id
  describe 'DELETE /v1/countries/:id' do
    before { delete "/v1/countries/#{country_id}/cities/#{id}", headers: headers }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end