class Weather
  def self.in(location_id)
    location = WeatherMan.new(location_id)
    return location.fetch
  end
  
end