class CarsController < ApplicationController
  before_action :set_car, only: [:show, :update, :destroy]
  skip_before_action :authorize_request, only: [:index, :show]

  # GET /cars
  def index
    @cars = Car.all
    json_response(@cars)
  end

  # POST /cars
  def create
    @car = Car.create!(cars_params)
    json_response(@car, :created)
  end

  # GET /cars/:id
  def show
    json_response(@car)
  end

  # PUT /cars/:id
  def update
    @car.update(cars_params)
    head :no_content
  end

  # DELETE /cars/:id
  def destroy
    @car.destroy
    head :no_content
  end

  private

  def cars_params
    # whitelist params
    params.permit( :make, :color, :year, :price )
  end

  def set_car
    @car = Car.find(params[:id])
  end

end
