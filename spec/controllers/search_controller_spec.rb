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
    flash[:errors].should_not be_empty
  end
  
  it "should redirect to the weather controller if there is only one match" do
    city = mock("city")
    cities = [city]
    city.should_receive(:id).and_return("location_id")
    CitySearch.should_receive(:find).with("some location").and_return(cities)
  
    post :index, :location => "some location"
    
    response.should redirect_to(:controller => :weather, :action => :display, :id => "location_id")
    
  end
  
  it "should redirect to the home controller if there is no match" do
    CitySearch.should_receive(:find).with("some other location").and_return([])
    
    post :index, :location => "some other location"
    
    response.should redirect_to(:controller => :home, :action => :index)
    flash[:errors].should_not be_empty
  end
end
