# spec/requests/Subjects_spec.rb
require 'rails_helper'

RSpec.describe 'Subjects API', type: :request do
  # initialize test data 
  let(:user) { create(:user) }
  let!(:subjects) { create_list(:subject, 3) }
  let(:subject_id) { subjects.first.id }
  let(:headers) { valid_headers }

  # Test suite for GET /subjects
  describe 'GET /v1/subjects' do
    before { get '/v1/subjects', headers: headers }

    it 'returns subjects' do
      expect(json).not_to be_empty
      expect(json.size).to eq(3)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /subjects/:id
  describe 'GET /v1/subjects/:id' do
    before { get "/v1/subjects/#{subject_id}", headers: headers }

    context 'when the record exists' do
      it 'returns the subject' do
        expect(json).not_to be_empty
        expect(json['subject']['id']).to eq(subject_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:subject_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(json['error']).to match("Not Found")
      end
    end
  end

  # Test suite for POST /subjects
  describe 'POST /v1/subjects' do
    context 'when the request is valid' do
      valid_attributes = { subject: { name: 'math' } }
      before { post '/v1/subjects', params: valid_attributes, headers: headers }

      it 'creates a subject' do
        expect(json['subject']['name']).to eq('math')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      invalid_attributes = { subject: { name: nil } }
      before { post '/v1/subjects', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['error'])
          .to match("Name can't be blank")
      end
    end
  end

  # Test suite for PUT /subjects/:id
  describe 'PUT /v1/subjects/:id' do
    context 'when the record exists' do
      valid_attributes = { subject: { name: 'English' } }
      before { put "/v1/subjects/#{subject_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(json['subject']['name']).to eq('English')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # Test suite for DELETE /subjects/:id
  describe 'DELETE /v1/subjects/:id' do
    before { delete "/v1/subjects/#{subject_id}", headers: headers }

    it 'returns status code 200 with deleted message' do
      expect(response).to have_http_status(200)
      expect(json['message']).to \
        eq("Subject deleted successfully")
    end
  end
end