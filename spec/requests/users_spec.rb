# spec/requests/users_spec.rb
require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let(:user) { create(:user) }
  let(:headers) { valid_headers }
  let(:country) { create(:country) }
  let(:city) { create(:city, country_id: country.id) }
  let!(:valid_attributes) do
    {
      user: attributes_for(:user, city_id: city.id, avatar: avatar)
    }
  end
  let(:avatar) { fixture_file_upload('avatar.jpg') }

  # User signup test suite
  describe 'POST  /v1/signup' do
    context 'when valid request' do
      before { post '/v1/signup', params: valid_attributes }

      it 'creates a new user' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to eq('User created successfully')
      end

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    # context 'missing avatar' do
    #   let(:valid_attributes) do 
    #     {
    #     user: attributes_for(:user, city_id: city.id, avatar: nil)
    #     }
    #   end

    #   before { post '/v1/signup', params: valid_attributes }

    #   it 'returns error message' do
    #     expect(json['error']).to eq('Avatar can\'t be blank')
    #   end
    # end


    context 'when invalid request' do
      before { post '/v1/signup', params: { user: { email: nil, password: nil } } }

      it 'does not create a new user' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['error']).to eq("Password can't be blank")
      end
    end
  end
end