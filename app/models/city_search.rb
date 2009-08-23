class CitySearch
  def self.find(search_criteria)
    return [] if search_criteria.blank?
    begin
      return WeatherMan.search(search_criteria)
    rescue WeatherMan::ApiError
      return []
    end
  end
end