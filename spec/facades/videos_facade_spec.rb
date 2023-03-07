require 'rails_helper'

RSpec.describe 'videos' do
  it 'returns JSON response' do
    country = 'Estonia'
    country_response = File.read('spec/fixtures/denmark.json')
    video_response = File.read('spec/fixtures/denmark_video.json')
    stub_request(:get, "https://restcountries.com/v3.1/name/#{country}")
      .to_return(status: 200, body: country_response)
    stub_request(:get, "https://youtube.googleapis.com/youtube/v3/search?channelId=#{ENV['youtube_channel_id']}&key=#{ENV['google_api_key']}&part=snippet&q=#{country}")
      .to_return(status: 200, body: video_response)
      
    video = VideoFacade.video_by_country(country)
    
    expect(video).to be_a Video
    expect(video.title).to be_a String
    expect(video.youtube_video_id).to be_a String
  end

  it 'returns an {} if no videos exist' do
    country = 'Oceana'
    country_response = File.read('spec/fixtures/denmark.json')
    video_response = File.read('spec/fixtures/empty_video.json')
    stub_request(:get, "https://restcountries.com/v3.1/name/#{country}")
      .to_return(status: 200, body: country_response)
    stub_request(:get, "https://youtube.googleapis.com/youtube/v3/search?channelId=#{ENV['youtube_channel_id']}&key=#{ENV['google_api_key']}&part=snippet&q=#{country}")
      .to_return(status: 200, body: video_response)
      
    video = VideoFacade.video_by_country(country)
    expect(video).to be_a Hash
    expect(video).to eq ({})
  end
end