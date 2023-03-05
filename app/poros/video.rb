class Video
  attr_reader :title,
              :youtube_video_id, 
              :country

  def initialize(attr, country)
    @country          = country
    @title            = attr[:snippet][:title]
    @youtube_video_id = attr[:id][:videoId]
  end
end