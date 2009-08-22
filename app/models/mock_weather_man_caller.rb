class WeatherMan
  attr_accessor :id, :name
  def initialize(id, name)
    @id, @name = id, name
  end
end

class WeatherManCaller
  def self.find_cities_for(search_criteria)
    if search_criteria == "Chicago"
      return [WeatherMan.new("USIL0225", "Chicago, IL"), WeatherMan.new("USCA0210", "Chicago Park, CA")]
    elsif search_criteria == "London"
      return [WeatherMan.new("UKXX0085", "London, United Kingdom"), WeatherMan.new("CAXX0255", "London, Canada")]
    else
      return []
    end
  end
end