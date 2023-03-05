class LearningResource
  attr_reader :country,
              :images,
              :videos

  def initialize(attr, country)
    @country_name = country
    @videos      = attr
    @images      = attr
  end
end