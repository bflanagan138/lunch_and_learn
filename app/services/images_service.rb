class ImageService
  def self.conn
    Faraday.new(url: "https://api.unsplash.com", params: { client_id: ENV['unsplash_client_id'] })
  end

  def self.images(country)
    response = conn.get("/search/photos?q=#{country}")
    images = parse(response)
    require 'pry'; binding.pry
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end