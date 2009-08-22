class CitySearch
  def self.find(search_criteria)
    return WeatherMan.search(search_criteria)
  end
end