# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Favorites API', type: :request do
  # initialize test data
  let!(:user) { create(:user) }
  let!(:car) { create(:car) }
  let!(:favorite) { FactoryBot.create(:favorite) }

  let(:headers) { valid_headers }

  # Test suite for GET /users/:user_id/favorites
  describe 'GET /users/:user_id/favorites' do
    # make HTTP get request before each example
    before { get "/users/#{user.id}/favorites", params: {}, headers: headers }
    it 'returns favorites for the user' do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for POST /users/#{user.id}/favorites/:id
    describe 'POST /users/#{user.id}/favorites/ ' do
    # valid payload
    let(:valid_attributes) { { car_id: car.id }.to_json }
      before { post "/users/#{user.id}/favorites/", params: valid_attributes, headers: headers }
      it 'creates a new favorites record' do
        expect(json).not_to be_empty
        expect(json.size).to eq(5)
      end
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

  # Test suite for PUT /users/:user_id/favorites/:id
  describe 'PUT /users/#{user.id}/favorites/:id' do
    # valid payload
    let(:valid_attributes) { { car_id: car.id }.to_json }
    before { put "/users/#{user.id}/favorites/#{favorite.id}", params: valid_attributes, headers: headers }
    it 'updates the record' do
      expect(response.body).to be_empty
    end
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

  # Test suite for DELETE /users/:user_id/favorites/:id
  describe 'DELETE /users/#{user.id}/favorites/:id' do
    before { delete "/users/#{user.id}/favorites/#{favorite.id}", params: {}, headers: headers }
    it 'deletes the record' do
      expect(response.body).to be_empty
    end
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
