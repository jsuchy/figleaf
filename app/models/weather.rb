class Weather
  attr_reader :weather_man_response
  
  def self.wrap_weather_man_response(old_name, new_name)
    method = <<EOS
def #{new_name}
  begin
    @weather_man_response.#{old_name}
  rescue
    return nil
  end
end
EOS
    class_eval method
  end
  
  wrap_weather_man_response "forecast.today.low", "low"
  wrap_weather_man_response "forecast.today.high", "high"
  wrap_weather_man_response "current_conditions.feels_like.to_i", "feels_like_in_farenheit"
  wrap_weather_man_response "current_conditions.wind.speed.to_i", "wind_speed"
  wrap_weather_man_response "current_conditions.wind.direction", "wind_direction"
  wrap_weather_man_response "current_conditions.description", "unaltered_description"
  wrap_weather_man_response "current_conditions.uv.index.to_i", "uv_index"
  wrap_weather_man_response "current_conditions.uv.description", "uv_description"
  wrap_weather_man_response "current_conditions.humidity.to_i", "humidity"
  wrap_weather_man_response "current_conditions.barometric_pressure.reading.to_f", "pressure"
  wrap_weather_man_response "current_conditions.dew_point.to_i", "dew_point"
  wrap_weather_man_response "current_conditions.visibility.to_f", "visibility"
  wrap_weather_man_response "forecast.today.sunrise", "sunrise_time"
  wrap_weather_man_response "forecast.today.sunset", "sunset_time"
  wrap_weather_man_response "current_conditions.temperature.to_i", "temperature"
  
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
    return :warm if (56..79).include?(feels_like_in_farenheit)
    return :hot if feels_like_in_farenheit >= 80
  end
  
  def wind_speed_description
    return :calm if wind_speed <= 7 
    return :breezy if (8..20).include?(wind_speed)
    return :windy if wind_speed >= 21
  end
  
  def description
    return "Who Knows!" if unaltered_description == "N/A"
    return unaltered_description
  end
  
  def description_category
    return :sunny if description.match(/Sunny/)
    return :sunny if description.match(/Clear/)
    return :cloudy if description.match(/Fair/)
    return :cloudy if description.match(/Cloudy/)
    return :cloudy if description.match(/Thunder/)
    return :snowy if description.match(/Snow/)
    return :rainy if description.match(/Showers/)
    return :rainy if description.match(/Storm/)
    return :rainy if description.match(/Rain/)
    return :cloudy
  end
  
  def valid?
    return false if @weather_man_response.nil?
    return false if @weather_man_response.current_conditions.nil?
    return false if @weather_man_response.forecast.nil?
    return true
  end
  
  alias :temp :feels_like_description
  alias :wind :wind_speed_description
  alias :prec :description_category
  
end