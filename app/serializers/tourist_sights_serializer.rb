class TouristSightsSerializer
  
  def self.tourist_sights(sights)
    {
      "data": sights.map do |sight|
        {
          "id": "null",
          "type": sight.class.to_s.downcase,
          "attributes":
          {
            "name": sight.name,
            "address": sight.address,
            "place_id": sight.place_id
          }
        }
      end
    }
  end
end
