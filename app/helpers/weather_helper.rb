module WeatherHelper
  def to_celcius(weather)
    return ((weather.temperature - 32)*(5.0/9)).to_i.to_s
  end
  
end
