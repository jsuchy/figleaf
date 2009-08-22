Then /^I should see the cities for "([^\"]*)"$/ do |search_criteria|
  cities = CitySearch.find(search_criteria)
  cities.size.should == 2
  cities.each do |city|
    response.should contain(city.name)
  end
end

Then /^I should see the information for "([^\"]*)"$/ do |location_id|
  weather_man_response = WeatherMan.new(location_id).fetch
  weather = Weather.new(weather_man_response)
  response.body.should include weather.low
  response.body.should include weather.high
  response.body.should include weather.wind_speed
end