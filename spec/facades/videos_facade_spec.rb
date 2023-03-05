require 'rails_helper'

RSpec.describe 'videos' do
  it 'returns JSON response' do
    country = 'Estonia'
    video = VideoFacade.video_by_country(country)
    expect(video).to be_a Video
    expect(video.country).to eq "Estonia"
    expect(video.title).to be_a String
    expect(video.youtube_video_id).to be_a String
  end
end