class ImageFacade
  def self.images_by_country(country)
    images = ImagesService.images_by_country(country)
    if images[:results] == []
      []
    else
      images[:results].map { |image| Image.new(image) }.first(10)
    end
  end
end