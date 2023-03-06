class Video
  attr_reader :title,
              :youtube_video_id

  def initialize(attr)
    @title            = attr[:snippet][:title]
    @youtube_video_id = attr[:id][:videoId]
  end
end