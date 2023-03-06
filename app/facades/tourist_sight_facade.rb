class TouristSightFacade
  def self.tourist_sights(lat, long)
    tourist_sights = TouristSightsService.tourist_sights(lat, long)
   
    tourist_sights[:features].map do |sight| 
      TouristSight.new(sight)
    end
  end
end