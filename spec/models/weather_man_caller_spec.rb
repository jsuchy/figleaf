require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WeatherManCaller do
  it "should find a list of cities when searching for London" do
    locations = [mock(WeatherMan)]
    WeatherMan.should_receive(:search).with('London').and_return(locations)
    WeatherManCaller.find_cities_for('London').should == locations
  end
end