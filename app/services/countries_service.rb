class RecipesService
  def self.conn
    Faraday.new(url: "https://restcountries.com")

  def self.random_country #WIP
    response = conn.get("/name/")
    country = parse(response)
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end