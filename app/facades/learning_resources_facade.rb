class LearningResourcesFacade
  def self.learning_resources(country)
    video = VideoFacade.video_by_country(country)
    images = ImageFacade.images_by_country(country)
    LearningResource.new(country, video, images)
   
  end
end