class WeatherManWind
  attr_accessor :speed
end
class WeatherManCurrentConditions
  attr_accessor :low, :high, :feels_like
  
  def wind
    return WeatherManWind.new
  end
end
class WeatherManResponse
  def initialize
  end
  def current_conditions
    return WeatherManCurrentConditions.new
  end
end
class WeatherMan
  attr_accessor :name, :id
  def initialize(location_id)
  end
  
  def self.search(search_criteria)
    if search_criteria == "Chicago"
      return [WeatherMan.mock("USIL0225", "Chicago, IL"), WeatherMan.mock("USCA0210", "Chicago Park, CA")]
    elsif search_criteria == "London"
      return [WeatherMan.mock("UKXX0085", "London, United Kingdom"), WeatherMan.mock("CAXX0255", "London, Canada")]
    else
      return []
    end
  end

  def self.mock(id, name)
    weather_man = WeatherMan.new(id)
    weather_man.name = name
    return weather_man
  end
  
  def fetch
    return WeatherManResponse.new
  end
end