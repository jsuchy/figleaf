Then /^I should see the cities for "([^\"]*)"$/ do |search_criteria|
  CitySearch.find(search_criteria).each do |city|
    response.should contain(city.name)
  end
end
