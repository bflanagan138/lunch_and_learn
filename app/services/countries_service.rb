class CountriesService
  def self.conn
    Faraday.new(url: "https://restcountries.com")
  end

  def self.random_country
    response = conn.get("/v3.1/all")
    countries = parse(response)
    countries.sample[:name][:common]
  end

  def self.exist(country)
    c = country.downcase.gsub(" ", "%20")
    response = conn.get("/v3.1/name/#{c}")
    if response.status == 200
      country = parse(response)
    else
      []
    end
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end