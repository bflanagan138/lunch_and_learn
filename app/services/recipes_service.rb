class RecipesService
  def self.conn
    Faraday.new(url: "https://api.edamam.com", params: { app_id: ENV['edamam_app_id'], app_key: ENV['edamam_app_key'], type: ENV['edamam_type']})
  end

  def self.recipes_by_country(country)
    response = conn.get("/api/recipes/v2?q=#{country}")
    recipes_by_country = parse(response)
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end