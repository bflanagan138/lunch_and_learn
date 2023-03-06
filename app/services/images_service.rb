class ImagesService
  def self.conn
    Faraday.new(url: "https://api.unsplash.com", params: { client_id: ENV['unsplash_client_id'] })
  end

  def self.images_by_country(country)
    response = conn.get("/search/photos?query=#{country}")
    images = parse(response)
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end