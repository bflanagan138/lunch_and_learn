class Recipe
  attr_reader :title,
              :url,
              :country,
              :image_url

  def initialize(attr, country)
    @title      = attr[:recipe][:label]
    @url        = attr[:recipe][:uri]
    @country    = country.downcase.capitalize
    @image_url  = attr[:recipe][:image]
  end
end