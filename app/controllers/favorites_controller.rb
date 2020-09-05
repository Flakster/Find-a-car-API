# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:destroy]

  # GET /users/:user_id/favorites
  def index
    @favorites = Favorite.where('user_id = ?', params[:user_id])
    json_response(@favorites)
  end

  # POST /users/:user_id/favorites
  def create
    @favorite = Favorite.create!(favorite_params)
    json_response(@favorite, :created)
  end

  # DELETE /favorites/:id
  def destroy
    @favorite.destroy
    head :no_content
  end

  private

  def favorite_params
    # whitelist params
    params.permit(:user_id, :car_id)
  end

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end
end
