class ImageFacade
  def self.image_by_country(country)
    images = ImagesService.images_by_country(country)
    images[:results].map { |image| Image.new(image) }.first(10)
  end
end