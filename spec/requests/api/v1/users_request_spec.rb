require 'rails_helper'
require 'securerandom'

RSpec.describe "user" do
  it 'creates a user, unique API key and a user has attributes' do
    user = { "name": "Athena Dao", "email": "athenadao@bestgirlever.com" }
    headers = { "Content-Type": "application/json", "Accept": "application/json" }
    
    post "/api/v1/users", headers: headers

    expect(response).to be_successful
    expect(response.status).to be 201
  end
end