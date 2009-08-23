class WeatherManForecastPart < OpenStruct
  def description
    return ""
  end
end

class WeatherManUV
  def index
    return "555"
  end
  def description
    return "Low"
  end
end

class WeatherManWind < OpenStruct
  def initialize
  end
  def speed
    return "12345"
  end
  def direction
    return "NNW"
  end
end
class WeatherManBarometer
  def reading
    return "29.45"
  end
end
class WeatherManCurrentConditions
  def wind
    return WeatherManWind.new
  end
  
  def feels_like
    return "123"
  end
  def description
    return "Mist"
  end
  def uv
    return WeatherManUV.new
  end
  def humidity
    return "85"
  end
  def barometric_pressure
    return WeatherManBarometer.new
  end
  def dew_point
    return "678"
  end
  def visibility
    return "6.2"
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
  def sunrise
    return "6:17 AM"
  end
  def sunset
    return "8:46 PM"
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