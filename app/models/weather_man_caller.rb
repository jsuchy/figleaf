class WeatherManCaller
  def self.find_cities_for(search_criteria)
    return WeatherMan.search(search_criteria)
  end
end