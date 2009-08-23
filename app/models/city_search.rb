class CitySearch
  def self.find(search_criteria)
    return [] if search_criteria.blank?
    return WeatherMan.search(search_criteria)
  end
end