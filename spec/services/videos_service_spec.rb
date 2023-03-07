require 'rails_helper'

RSpec.describe 'videos' do
  it 'returns JSON response' do
    country = 'Denmark'
    country_response = File.read('spec/fixtures/denmark.json')
    video_response = File.read('spec/fixtures/denmark_video.json')
    stub_request(:get, "https://restcountries.com/v3.1/name/#{country}")
      .to_return(status: 200, body: country_response)
    stub_request(:get, "https://youtube.googleapis.com/youtube/v3/search?channelId=#{ENV['youtube_channel_id']}&key=#{ENV['google_api_key']}&part=snippet&q=Denmark")
      .to_return(status: 200, body: video_response)
      
    results = VideosService.videos_by_country(country)
    expect(results).to have_key(:items)
    expect(results[:items]).to be_a Array
    expect(results[:items][0]).to be_a Hash
    expect(results[:items][0]).to have_key(:snippet)
    expect(results[:items][0][:snippet]).to be_a Hash
    expect(results[:items][0][:snippet]).to have_key(:title)
    expect(results[:items][0][:snippet][:title]).to be_a String
    expect(results[:items][0]).to have_key(:id)
    expect(results[:items][0][:id]).to be_a Hash
    expect(results[:items][0][:id]).to have_key(:videoId)
    expect(results[:items][0][:id][:videoId]).to be_a String
  end
end