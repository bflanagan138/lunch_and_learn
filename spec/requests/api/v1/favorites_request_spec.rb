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

  it 'returns all favorites saved by a user' do
    user1 = User.create!({ name: "Lol Tolhurst", email: "lol@thecure.com", api_key: SecureRandom.hex(16)})

    recipe_1 = user1.favorites.create!("country": "Egypt", "recipe_link": "http://www.thekitchn.com/recipe-egyptian-tomato-soup", "recipe_title": "Recipe: Egyptian Tomato Soup")
    recipe_2 = user1.favorites.create!("country": "Thailand", "recipe_link": "https://www.tastingtable.com/crabfriedrice", "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)")
    recipe_3 = user1.favorites.create!("country": "Mexico", "recipe_link": "https://www.mexicaneats.com/burritos", "recipe_title": "Best Burritos Ever")
    
    get "/api/v1/favorites?api_key=#{user1.api_key}"
    
    expect(response).to be_successful
    expect(response.status).to be 200
      
    parse = JSON.parse(response.body, symbolize_names: true)
    
    expect(parse).to be_a Hash
    expect(parse).to have_key(:data)
    expect(parse[:data]).to be_a Array
    parse[:data].each do |recipe|
      expect(recipe).to be_a Hash
      expect(recipe).to have_key(:id)
      expect(recipe[:id]).to be_a String
      expect(recipe).to have_key(:type)
      expect(recipe[:type]).to eq ("favorite")
      expect(recipe).to have_key(:attributes)
      expect(recipe[:attributes]).to be_a Hash
      expect(recipe[:attributes]).to have_key(:recipe_title)
      expect(recipe[:attributes][:recipe_title]).to be_a String
      expect(recipe[:attributes]).to have_key(:recipe_link)
      expect(recipe[:attributes][:recipe_link]).to be_a String
      expect(recipe[:attributes]).to have_key(:country)
      expect(recipe[:attributes][:country]).to be_a String
      expect(recipe[:attributes]).to have_key(:created_at)
      expect(recipe[:attributes][:created_at]).to be_a String
    end
  end

  xit 'returns an error if user is invalid' do #WIP
    user1 = User.create!({ name: "Lol Tolhurst", email: "lol@thecure.com", api_key: SecureRandom.hex(16)})
    
    recipe_1 = user1.favorites.create!("country": "Egypt", "recipe_link": "http://www.thekitchn.com/recipe-egyptian-tomato-soup", "recipe_title": "Recipe: Egyptian Tomato Soup")
    recipe_2 = user1.favorites.create!("country": "Thailand", "recipe_link": "https://www.tastingtable.com/crabfriedrice", "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)")
    
    get "/api/v1/favorites?api_key=#{user1.api_key}"
    
    user2 = User.create!({ name: "Dave Lombardo", email: "lol@thecure.com", api_key: SecureRandom.hex(16)})
    recipe_3 = user2.favorites.create!("country": "Mexico", "recipe_link": "https://www.mexicaneats.com/burritos", "recipe_title": "Best Burritos Ever")
    get "/api/v1/favorites?api_key=#{user2.api_key}"

    
    expect(response).to_not be_successful
    expect(response.status).to be 401
  end
end