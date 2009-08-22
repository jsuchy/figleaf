class Weather
  def self.wrap_weather_man_response(old_name, new_name)
    class_eval "def #{new_name}; @weather_man_response.#{old_name}; end\n"
  end
  
  wrap_weather_man_response "current_conditions.low", "low"
  wrap_weather_man_response "current_conditions.high", "high"
  wrap_weather_man_response "current_conditions.feels_like", "feels_like_in_farenheit"
  wrap_weather_man_response "current_conditions.wind.speed", "wind_speed"
  
  def initialize(weather_man_response)
    @weather_man_response = weather_man_response
  end
  
  def self.in(location_id)
    location = WeatherMan.new(location_id)
    return Weather.new(location.fetch)
  end  
  
  def feels_like_description
    return :cold if feels_like_in_farenheit <= 32
    return :chilly if (33..55).include?(feels_like_in_farenheit)
    return :nice if (56..79).include?(feels_like_in_farenheit)
    return :hot if feels_like_in_farenheit >= 80
  end
  
  def wind_speed_description
    return :calm if wind_speed.to_i <= 10 
    return :breezy if (11..30).include?(wind_speed.to_i)
    return :windy if wind_speed.to_i >= 31
  end
end