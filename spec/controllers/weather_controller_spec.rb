require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WeatherController do

  it "should display the weather report" do
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
  
  it "should display the city name" do
    weather = mock(Weather, :valid? => true)
    Weather.should_receive(:in).with("UKXX0085").and_return(weather)
    
    get :display, :id => "UKXX0085", :city_name => 'London, United Kingdom'
    
    assigns[:weather].should == weather
    assigns[:city_name].should == "London, United Kingdom"
  end

  describe "iphone" do

    before(:each) do
      @weather = mock(Weather, :valid? => true)
      Weather.stub!(:in).and_return(@weather)
      @outfit = mock(Outfit)
      Outfit.stub!(:find).and_return(@outfit)
    end
    
    it "renders iphone display for iPhone" do
      pending
      setup_iphone_request
      
      get :display, :id => "irrelevant"

      response.should render_template("display.iphone.erb")
    end

    it "renders iphone display for Mobile Safari" do
      pending
      setup_mobile_safari_request

      get :display, :id => "irrelevant"

      response.should render_template("display.iphone.erb")
    end
    
    it "sets the outfit on an iphone request" do
      pending
      setup_iphone_request
      Outfit.should_receive(:find).with(@weather).and_return(@outfit)

      get :display, :id => "irrelevant"

      assigns[:outfit].should == @outfit
    end

    it "does not render layout on an iphone request" do
      pending
      setup_iphone_request
      get :display, :id => "irrelevant"

      response.layout.should be_nil
    end

  end
  
end
