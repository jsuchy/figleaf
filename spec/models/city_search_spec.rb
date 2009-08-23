require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CitySearch do
  it "should find a list of cities when searching for London" do
    locations = [mock(WeatherMan)]
    WeatherMan.should_receive(:search).with('London').and_return(locations)
    CitySearch.find('London').should == locations
  end
  
  it "should not call find if the location is blank" do
    WeatherMan.should_not_receive(:search)
    
    CitySearch.find("").should == []
  end
  
  it "should return an empty array if there is an api error" do
    WeatherMan.should_receive(:search).with("really long text").and_raise(WeatherMan::ApiError)
    
    CitySearch.find("really long text").should == []
  end
end