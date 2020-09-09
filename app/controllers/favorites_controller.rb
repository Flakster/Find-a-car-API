# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :set_favorite, only: %i[update destroy]
  before_action :set_user_id

  # GET /users/:user_id/favorites
  def index
    # The user can only see its own favorites
    if @current_user.id == @user_id
      @favorites = User.find(params[:user_id]).cars
      json_response(@favorites)
    else
      render(json: { message: Message.unauthorized }, status: 401)
    end
  end

  # POST /users/:user_id/favorites
  def create
    # The user can only create its own favorites
    if @current_user.id == @user_id
      @favorite = Favorite.create!(favorite_params)
      json_response(@favorite, :created)
    else
      render(json: { message: Message.unauthorized }, status: 401)
    end
  end

  # PUT /users/:user_id/favorites/:id
  def update
    # The user can only update its own favorites
    if @current_user.id == @user_id
      @favorite.update(favorite_params)
      head :no_content
    else
      render(json: { message: Message.unauthorized }, status: 401)
    end
  end

  # DELETE /users/:user_id/favorites/:id
  def destroy
    # The user can only delete its own favorites
    if @current_user.id == @user_id
      @favorite.destroy
      head :no_content
    else
      render(json: { message: Message.unauthorized }, status: 401)
    end
  end

  private

  def favorite_params
    # whitelist params
    params.permit(:user_id, :car_id)
  end

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end

  def set_user_id
    @user_id = params[:user_id].to_i
  end
end
