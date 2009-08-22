class Weather
  def self.wrap_weather_man_response(old_name, new_name)
    class_eval "def #{new_name}; @weather_man_response.#{old_name}; end\n"
  end
  
  wrap_weather_man_response "forecast.today.low", "low"
  wrap_weather_man_response "forecast.today.high", "high"
  wrap_weather_man_response "current_conditions.feels_like.to_i", "feels_like_in_farenheit"
  wrap_weather_man_response "current_conditions.wind.speed.to_i", "wind_speed"
  wrap_weather_man_response "forecast.today.day.description", "description"
  
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
    return :calm if wind_speed <= 10 
    return :breezy if (11..30).include?(wind_speed)
    return :windy if wind_speed >= 31
  end
  
  def description_category
    return :sunny if description.match(/Sunny/)
    return :sunny if description.match(/Fair/)
    return :sunny if description.match(/Clear/)
    return :cloudy if description.match(/Cloudy/)
    return :snowy if description.match(/Snow/)
    return :rainy if description.match(/Showers/)
    return :rainy if description.match(/Storms/)
    return :rainy if description.match(/Rain/)
  end
end