class Api::V1::LearningResourcesController < ApplicationController
  def index
    country = LearningResourcesFacade.learning_resources(params[:country])
    render json: LearningResourcesSerializer.new(country)
    
  end
end