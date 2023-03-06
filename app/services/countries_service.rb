class CountriesService
  def self.conn
    Faraday.new(url: "https://restcountries.com")
  end

  def self.random_country
    response = conn.get("/v3.1/all")
    countries = parse(response)
    countries.sample
  end

  def self.exist(country)
    response = conn.get("/v3.1/name/#{country}")
    if conn.get("/v3.1/name/#{country}").status == 200
      country = parse(response)
    else
      []
    end
  end

  def self.learning_resources(country)
    response = conn.get("/v3.1/name/#{country}")
    country = parse(response)
   
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end