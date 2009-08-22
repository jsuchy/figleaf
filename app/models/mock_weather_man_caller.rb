class WeatherMan
  attr_accessor :id, :name
  
  def self.mock(id, name)
    @id, @name = id, name
    return self
  end
end

class WeatherManCaller
  def self.find_cities_for(search_criteria)
    if search_criteria == "Chicago"
      return [WeatherMan.mock("USIL0225", "Chicago, IL"), WeatherMan.mock("USCA0210", "Chicago Park, CA")]
    elsif search_criteria == "London"
      return [WeatherMan.mock("UKXX0085", "London, United Kingdom"), WeatherMan.mock("CAXX0255", "London, Canada")]
    else
      return []
    end
  end
end