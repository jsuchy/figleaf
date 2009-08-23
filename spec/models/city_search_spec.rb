require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CitySearch do
  it "should find a list of cities when searching for London" do
    locations = [mock(WeatherMan)]
    WeatherMan.should_receive(:search).with('London').and_return(locations)
    CitySearch.find('London').should == locations
  end
end