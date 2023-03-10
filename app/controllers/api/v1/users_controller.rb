class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    user = User.new(user_params)
    user.save
    render json: UserSerializer.new(user), status: 201
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end