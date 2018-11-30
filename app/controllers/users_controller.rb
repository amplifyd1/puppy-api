class UsersController < ApplicationController
   skip_before_action :authorize_request, only: :create
   before_action :set_user, only: [:show]
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  def index
    @users = User.all
    json_response(@users)
  end

  def show
    json_response(["user:", @user, "posts:", @user.posts, "likes:", @user.likes])
  end

  private

  def user_params
    params.permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end

  def set_user
    @user = User.find(params[:id])
  end
end
