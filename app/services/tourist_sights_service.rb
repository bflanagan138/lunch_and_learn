class TouristSightsService
  # def self.conn
  #   Faraday.new(url: "https://api.geoapify.com", params: { apiKey:ENV['places_api_key'], categories:"tourism.sights", filter:"circle:#{lat},#{long},20000", limit:20 } )
  # end

  def self.tourist_sights(lat, long)
    response = Faraday.new(url: "https://api.geoapify.com/api/v1/places?", params: { apiKey:ENV['places_api_key'], categories:"tourism.sights", filter:"circle:#{lat},#{long},20000", limit:"20" } )
    require 'pry'; binding.pry
    tourism_sights = parse(response)
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end