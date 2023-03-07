require 'rails_helper'

RSpec.describe "learning resources request" do
  it 'returns a list of images from provided country' do
    country = "Denmark"
    images_response = File.read('spec/fixtures/country_images.json')
    country_response = File.read('spec/fixtures/country.json')
    video_response = File.read('spec/fixtures/denmark_video.json')
    stub_request(:get, "https://api.unsplash.com/search/photos?client_id=#{ENV['unsplash_client_id']}&query=#{country}")
    .to_return(status: 200, body: images_response)
    stub_request(:get, "https://restcountries.com/v3.1/name/#{country}")
      .to_return(status: 200, body: country_response)
    stub_request(:get, "https://youtube.googleapis.com/youtube/v3/search?channelId=#{ENV['youtube_channel_id']}&key=#{ENV['google_api_key']}&part=snippet&q=#{country}")
      .to_return(status: 200, body: video_response)

    get "/api/v1/learning_resources?country=#{country}"
    expect(response).to be_successful
    expect(response.status).to be 200
    
    parse = JSON.parse(response.body, symbolize_names: true)
   
    expect(parse).to be_a Hash
    expect(parse).to have_key (:data)
    expect(parse[:data]).to be_a Hash
    expect(parse[:data]).to have_key(:id)
    expect(parse[:data][:id]).to eq nil
    expect(parse[:data]).to have_key(:type)
    expect(parse[:data][:type]).to eq "learning_resource"
    expect(parse[:data]).to have_key(:attributes)
    expect(parse[:data][:attributes]).to be_a Hash
    expect(parse[:data][:attributes]).to have_key(:country)
    expect(parse[:data][:attributes][:country]).to eq ("#{country}")
    expect(parse[:data][:attributes]).to have_key(:video)
    expect(parse[:data][:attributes][:video]).to be_a Hash
    expect(parse[:data][:attributes][:video]).to have_key(:title)
    expect(parse[:data][:attributes][:video][:title]).to be_a String
    expect(parse[:data][:attributes][:video]).to have_key(:youtube_video_id)
    expect(parse[:data][:attributes][:video][:youtube_video_id]).to be_a String
    expect(parse[:data][:attributes]).to have_key(:images)
    expect(parse[:data][:attributes][:images]).to be_a Array
    parse[:data][:attributes][:images].each do |image|
      expect(image).to have_key(:alt_tag)
      if (image[:alt_tag] != nil)
        expect(image[:alt_tag]).to be_a String
      end
      expect(image).to have_key(:url)
      expect(image[:url]).to be_a String
    end
  end
end