require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WeatherHelper do
  include WeatherHelper
  it "should convert to celcius" do
    weather = mock('weather', :temperature => 48)
    to_celcius(weather).should == "8"
  end
  
end
