class Api::V1::UsersController < ApplicationController
  def index

  end
  
  def create
    require 'pry'; binding.pry
   user = User.new(user_params)
   if user.save
    render json: UserSerializer.new(user), status: 201
   end
  end

  def new

  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end