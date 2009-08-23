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
  response.body.should include(weather.feels_like_in_farenheit.to_s)
  response.body.should include(weather.wind_speed.to_s)
  response.body.should include(weather.description.to_s)
  response.body.should include(weather.pressure.to_s)
  response.body.should include(weather.uv_description.to_s)
  response.body.should include(weather.sunrise_time.to_s)
end

Then /^I should see an error message$/ do
  response.should have_tag("div[class=error_message]")
end

Then /^I should not see an error message$/ do
  response.should_not have_tag("div[class=error_message]")
end
