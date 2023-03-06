class Image
  attr_reader :alt_tag,
              :url

  def initialize(attr)
    @alt_tag  = attr[:alt_description]
    @url      = attr[:urls][:raw]
  end
end