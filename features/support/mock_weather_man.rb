class WeatherManForecastPart < OpenStruct
  def description
    return ""
  end
end

class WeatherManWind < OpenStruct
  def initialize
  end
  def speed
    return 12345
  end
end
class WeatherManCurrentConditions
  attr_accessor :feels_like
  
  def wind
    return WeatherManWind.new
  end
  
  def description
    return ""
  end
end
class WeatherManForecastDay
  def day
    return WeatherManForecastPart.new
  end
  def low
    return "low temperature"
  end
  def high
    return "high temperature"
  end
end
class WeatherManForecast < Array
  def today
    return WeatherManForecastDay.new
  end
end

class WeatherManResponse
  def initialize
  end
  def current_conditions
    return WeatherManCurrentConditions.new
  end
  def forecast
    return WeatherManForecast.new
  end
end
class WeatherMan
  attr_accessor :name, :id
  def initialize(location_id)
    @id = location_id
  end
  
  def self.search(search_criteria)
    raise "WeatherMan Error 0: An unknown error has occurred." if search_criteria.blank?
    if search_criteria == "Chicago"
      return [WeatherMan.mock("USIL0225", "Chicago, IL"), WeatherMan.mock("USCA0210", "Chicago Park, CA")]
    elsif search_criteria == "London"
      return [WeatherMan.mock("UKXX0085", "London, United Kingdom"), WeatherMan.mock("CAXX0255", "London, Canada")]
    elsif search_criteria == "60048"
      return [WeatherMan.mock("60048", "Libertyville, IL (60048)")]
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