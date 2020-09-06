# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User API', type: :request do
  let!(:user) { FactoryBot.create(:admin) }
  let!(:headers) { valid_headers }

  # Test suite for GET/users
  describe 'GET /users' do
    context 'when valid request' do
      before { get '/users', params: {}, headers: headers }
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # User signup test suite
  describe 'POST /signup' do
    let(:valid_attributes) do
      attributes_for(:user, password_confirmation: user.password)
    end
    context 'when valid request' do
      before { post '/signup', params: valid_attributes.to_json, headers: headers }

      it 'creates a new user' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Account created successfully/)
      end

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before { post '/signup', params: {}, headers: headers }

      it 'does not create a new user' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message'])
          # rubocop:disable Metrics/LineLength
          .to match(/Validation failed: Password can't be blank, Name can't be blank, Email can't be blank, Password digest can't be blank/)
        # rubocop:enable Metrics/LineLength
      end
    end
  end

  # Test suite for PUT/users/:id
  describe 'PUT/user/:id' do
    let(:valid_attributes) do
      attributes_for(:user, password_confirmation: user.password)
    end
    context 'when the record exists' do
      before { put "/users/#{user.id}", params: valid_attributes.to_json, headers: headers }
      it 'updates the record' do
        expect(response.body).to be_empty
      end
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE/users/:id
  describe 'DELETE/user/:id' do
    context 'when the record exists' do
      before { put "/users/#{user.id}", params: {}, headers: headers }
      it 'updates the record' do
        expect(response.body).to be_empty
      end
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
end
