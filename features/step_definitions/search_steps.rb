Then /^I should see the cities for "([^\"]*)"$/ do |search_criteria|
  WeatherManCaller.find_cities_for(search_criteria).each do |city|
    response.should contain(city.name)
  end
end
