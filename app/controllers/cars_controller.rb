# frozen_string_literal: true

class CarsController < ApplicationController
  before_action :set_car, only: %i[show update destroy]

  # GET /cars
  def index
    @cars = Car.all
    json_response(@cars)
  end

  # POST /cars
  def create
    if @current_user.admin
      @car = Car.create!(cars_params)
      json_response(@car, :created)
    else
      render(json: { message: Message.unauthorized }, status: 401)
    end
  end

  # GET /cars/:id
  def show
    json_response(@car)
  end

  # PUT /cars/:id
  def update
    if @current_user.admin
      @car.update(cars_params)
      head :no_content
    else
      render(json: { message: Message.unauthorized }, status: 401)
    end
  end

  # DELETE /cars/:id
  def destroy
    if @current_user.admin
      @car.destroy
      head :no_content
    else
      render(json: { message: Message.unauthorized }, status: 401)
    end
  end

  private

  def cars_params
    # whitelist params
    params.permit(:make, :color, :year, :price)
  end

  def set_car
    @car = Car.find(params[:id])
  end
end
