require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Weather do
  it "should return the weather for a given location id" do
    weather_man = mock(WeatherMan)
    weather_in_location = mock(WeatherManResponse)
    WeatherMan.should_receive(:new).with("UKXX0085").and_return(weather_man)
    weather_man.should_receive(:fetch).and_return(weather_in_location)
    
    Weather.in("UKXX0085").should == weather_in_location
  end
end