# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Car API', type: :request do
  # initialize test data
  let(:user) { create(:user) }
  let!(:cars) { create_list(:car, 10) }
  let(:car_id) { cars.first.id }
  # authorize request
  let(:headers) { valid_headers }

  # Test suite for GET /cars
  describe 'GET /cars' do
    # make HTTP get request before each example
    before { get '/cars', params: {}, headers: headers }

    it 'returns cars' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /cars/:id
  describe 'GET /cars/:id' do
    before { get "/cars/#{car_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the car' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(car_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:car_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Car/)
      end
    end
  end
end
