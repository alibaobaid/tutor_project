require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  # Authentication test suite
  describe 'POST /v1/auth/login' do
    # create test user
    let!(:user) { create(:user) }
    # set test valid and invalid credentials
    let(:valid_credentials) do
      { user:
        { 
          email: user.email,
          password: user.password
        }
      }
    end
    let(:invalid_credentials) do
      { user:
        {
        email: Faker::Internet.email,
        password: Faker::Internet.password
        }
      }
    end

    # set request.headers to our custon headers
    # before { allow(request).to receive(:headers).and_return(headers) }

    # returns auth token when request is valid
    context 'When request is valid' do
      before { post '/auth/login', params: valid_credentials }

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    # returns failure message when request is invalid
    context 'When request is invalid' do
      before { post '/auth/login', params: invalid_credentials }

      it 'returns a failure message' do
        expect(json['message']).to match(/Invalid credentials/)
      end
    end
  end
end