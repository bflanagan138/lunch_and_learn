require 'rails_helper'

RSpec.describe "favorites" do
  it 'saves a recipe as a favorite' do
    
    country = "Thailand"
    link = "https://www.tastingtable.com/687784/crab-fried-rice-recipe-from-chef-bee/"
    title = "Crab Fried Rice (Khaao Pad Bpu)"
    user = User.last
    body = { api_key: "#{user.api_key}", country: country, recipe_link: link, recipe_title: title}
    headers = { "Content-Type": "application/json", "Accept": "application/json" }
 
    post "/api/v1/favorites", headers: headers, params: JSON.generate(body)
    
  end
end
#     expect(response).to be_successful
#     expect(response.status).to be 201
#     parse = JSON.parse(response.body, symbolize_names: true)
# require 'pry'; binding.pry
#     expect(parse).to be_a Hash
#     expect(parse).to have_key (:data)
#     expect(parse[:data]).to be_a Hash
#     expect(parse[:data]).to have_key (:id)
#     expect(parse[:data][:id]).to be_a String
#     expect(parse[:data]).to have_key (:type)
#     expect(parse[:data][:type]).to be_a String
#     expect(parse[:data]).to have_key (:attributes)
#     expect(parse[:data][:attributes]).to be_a Hash
#     expect(parse[:data][:attributes]).to have_key (:name)
#     expect(parse[:data][:attributes][:name]).to be_a String
#     expect(parse[:data][:attributes]).to have_key (:email)
#     expect(parse[:data][:attributes][:email]).to be_a String
#     expect(parse[:data][:attributes]).to have_key (:api_key)
#     expect(parse[:data][:attributes][:api_key]).to be_a String

#     new_user = User.last
#     expect(new_user).to be_a User
#     expect(new_user.id).to eq User.last[:id]
#     expect(new_user.id).to be_a Integer
#     expect(new_user.name).to be_a String
#     expect(new_user.name).to eq(body[:name])
#     expect(new_user.email).to be_a String
#     expect(new_user.email).to eq(body[:email])
#     expect(new_user.api_key).to be_a String
