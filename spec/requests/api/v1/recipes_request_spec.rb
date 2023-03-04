require 'rails_helper'

RSpec.describe "recipe API request" do
  it 'returns a list of recipes from provided country' do
    country = 'Estonia'
    get "/api/v1/recipes?q=#{country}"
   
   #write tests, too tired to do tonight
  end
end