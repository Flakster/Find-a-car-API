# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Car API', type: :request do
  # initialize test data
  let!(:user) { create(:admin) }
  let!(:cars) { create_list(:car, 10) }
  let!(:car) { cars.first }
  let(:car_id) { car.id }
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

  # Test suite for POST /cars
  describe 'POST /cars' do
    let!(:user) { FactoryBot.create(:admin) }
    let(:valid_attributes) do
      attributes_for(:car)
    end
    context 'when request attributes are valid' do
      before { post '/cars', params: valid_attributes.to_json, headers: headers }
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
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

  # Tests suite for PUT /cars/:id
  describe 'PUT /cars/:id' do
    let(:valid_attributes) { attributes_for(:car) }
    context 'when the record exists' do
      before { put "/cars/#{car.id}", params: valid_attributes.to_json, headers: headers }
      it 'updates the record' do
        expect(response.body).to be_empty
      end
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Tests suite for DELETE /cars/:id
  describe 'DELETE /cars/:id' do
    context 'when the record exists' do
      before { put "/cars/#{car.id}", params: {}, headers: headers }
      it 'deletes the record' do
        expect(response.body).to be_empty
      end
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
end
