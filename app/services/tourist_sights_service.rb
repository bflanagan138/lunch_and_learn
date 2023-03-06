class TouristSightsService
  # def self.conn
  #   Faraday.new(url: "https://api.geoapify.com", params: { apiKey: ENV['places_api_key'], categories: "tourism.sights", filter: "circle:#{long},#{lat},1000", limit: 20 } )
  # end

  def self.tourist_sights(lat, long)
    response = Faraday.get("https://api.geoapify.com/v2/places?categories=tourism.sights&filter=circle:2.33,48.87,1000&limit=20&apiKey=07e6673b28764534a2dd732c5a1121fe")
    tourism_sights = parse(response)
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end