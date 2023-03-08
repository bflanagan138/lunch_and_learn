require 'rails_helper'

RSpec.describe "favorites" do
  it 'saves a recipe as a favorite' do
    country = "Thailand"
    link = "https://www.tastingtable.com/687784/crab-fried-rice-recipe-from-chef-bee/"
    title = "Crab Fried Rice (Khaao Pad Bpu)"
    user = User.create!({ name: "Robert Smith", email: "rsmith@thecure.com", api_key: SecureRandom.hex(16)})
    body = { api_key: user.api_key, country: country, recipe_link: link, recipe_title: title}
    headers = { "Content-Type": "application/json", "Accept": "application/json" }
    
    post "/api/v1/favorites", headers: headers, params: JSON.generate(body)
   
    expect(response).to be_successful
    expect(response.status).to eq 201

    parse = JSON.parse(response.body, symbolize_names: true)
   
    expect(parse).to be_a Hash
    expect(parse).to have_key (:success)
    expect(parse[:success]).to eq ("Favorite added successfully")
  end

  it 'returns an error if api key is invalid' do
    
    country = "Thailand"
    link = "https://www.tastingtable.com/687784/crab-fried-rice-recipe-from-chef-bee/"
    title = "Crab Fried Rice (Khaao Pad Bpu)"
    user = User.last
    body = { api_key: "abcd", country: country, recipe_link: link, recipe_title: title}
    headers = { "Content-Type": "application/json", "Accept": "application/json" }
 
    post "/api/v1/favorites", headers: headers, params: JSON.generate(body)

    expect(response).to_not be_successful
    expect(response.status).to eq 401

    parse = JSON.parse(response.body, symbolize_names: true)
   
    expect(parse).to be_a Hash
    expect(parse).to have_key (:error)
    expect(parse[:error]).to eq ("Login credentials missing or invalid")
  end
end