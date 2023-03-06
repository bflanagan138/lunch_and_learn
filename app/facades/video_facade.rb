class VideoFacade
  def self.video_by_country(country)
    videos = VideosService.videos_by_country(country)
    video = videos[:items].map { |video| Video.new(video) }.first
    video
  end
end