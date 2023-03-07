class Api::V1::UsersController < ApplicationController
  def index

  end
  
  def create
    require 'pry'; binding.pry
   user = User.new(params)
  end
end