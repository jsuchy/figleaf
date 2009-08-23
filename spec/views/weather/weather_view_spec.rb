require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "weather view spec" do
  before(:each) do
    @weather = mock(Weather, :null_object => true)
    Outfit.stub!(:find).and_return(mock(Outfit, :null_object => true))
    assigns[:weather] = @weather
  end
  
  def should_render_and_include(text)
    render :template => "weather/display"
    
    response.body.should include(text)
  end

  it "should display the weather description" do
    @weather.stub!(:description).and_return("some description")
    
    should_render_and_include("some description")
  end
  
  it "should display the real temperature" do
    @weather.stub!(:temperature).and_return(70)
    
    should_render_and_include("70ºF")
  end
  
  it "should display the wind information" do
    @weather.stub!(:wind_speed).and_return(2)
    @weather.stub!(:wind_direction).and_return("NNW")
    
    should_render_and_include("NNW at 2 mph")
  end
  
  it "should display the air humidity" do
    @weather.stub!(:humidity).and_return(84)
    
    should_render_and_include("84%")
  end
  
  it "should display the pressure" do
    @weather.stub!(:pressure).and_return(29.45)
    
    should_render_and_include("29.45 in.")
  end
  
  it "should display the dew point" do
    @weather.stub!(:dew_point).and_return(56)
    
    should_render_and_include("56°F")
  end
  
  it "should display the sunrise time" do
    @weather.stub!(:sunrise_time).and_return("6:17 AM")
    
    should_render_and_include("6:17 AM")
  end
  
  it "should display the sunset time" do
    @weather.stub!(:sunset_time).and_return("8:46 PM")
    
    should_render_and_include("8:46 PM")
  end
end