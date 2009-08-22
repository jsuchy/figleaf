require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WeatherController do

  #Delete this example and add some real ones
  it "should use WeatherController" do
    controller.should be_an_instance_of(WeatherController)
  end
  
  it "display the weather report" do
    weather = mock(Weather)
    Weather.should_receive(:in).with("UKXX0085").and_return(weather)
    
    
    get :display, :id => "UKXX0085"
    
    assigns[:weather].should == weather
  end

end
