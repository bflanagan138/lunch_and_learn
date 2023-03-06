class LearningResource
  attr_reader :country,
              :images,
              :video

  def initialize(country, video, images)
    @country = country
    @video   = video
    @images  = images
  end
end