require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WeatherController do

  it "display the weather report" do
    weather = mock(Weather, :valid? => true)
    Weather.should_receive(:in).with("UKXX0085").and_return(weather)
    
    get :display, :id => "UKXX0085"
    
    assigns[:weather].should == weather
  end

  it "should redirect to the homepage if the found weather" do
    weather = mock(Weather)
    weather.should_receive(:valid?).and_return(false)
    Weather.stub!(:in).and_return(weather)
    
    get :display, :id => "blah"
    
    response.should redirect_to({:controller => "home", :action => "index"})
    flash[:errors].should_not be_blank
  end
end
