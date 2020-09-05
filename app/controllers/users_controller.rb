# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, except: [:create, :index]
  skip_before_action :authorize_request, only: :create

  # GET /users
  def index
    if @current_user.admin
      @users = User.all
      json_response(@users)
    else
      render(json: { message: Message.unauthorized }, status: 401)
    end
  end

  # POST /signup
  # return authenticated token upon signup
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  # PUT /users/:id
  def update
    if @current_user.admin
      @user.update(user_params)
      head :no_content
    else
      render(json: { message: Message.unauthorized }, status: 401)
    end
  end

  # DELETE /users/:id
  def destroy
    if @current_user.admin
      @user.destroy
      head :no_content
    else
      render(json: { message: Message.unauthorized }, status: 401)
    end
  end

  private

  def user_params
    params.permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :admin
    )
  end

  def set_user
    @user = User.find(params[:id])
  end
end
