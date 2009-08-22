require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SearchController do

  it "should render the homepage" do
    CitySearch.stub!(:find).and_return(["one", "two"])
    
    post :index
    
    response.should render_template("home/index")
  end
  
  it "should get the list of matches given a location" do
    cities = [mock("city"), mock("city")]
    CitySearch.should_receive(:find).with("some location").and_return(cities)
    
    post :index, :location => "some location"
    
    assigns[:cities].should == cities
  end
  
  it "should redirect to the weather controller if there is only one match" do
    city = [mock("city")]
    CitySearch.should_receive(:find).with("some location").and_return(city)
  
    post :index, :location => "some location"
    
    response.should redirect_to(:controller => :weather, :action => :display, :id => "some location")
    
  end
  
end
