Then /^I should see the cities for "([^\"]*)"$/ do |search_criteria|
  cities = CitySearch.find(search_criteria)
  cities.size.should == 2
  cities.each do |city|
    response.should contain(city.name)
  end
  puts response.body
end
