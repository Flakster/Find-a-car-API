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

  # Test suite for DELETE /favorites/:id
  describe 'DELETE /favorites/:id' do
    before { delete "/favorites/#{favorite.id}", params: {}, headers: headers }
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
