require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SearchController do

  it "should render the homepage" do
    CitySearch.stub!(:find)
    
    post :index
    
    response.should render_template("home/index")
  end
  
  it "should get the list of matches given a location" do
    cities = [mock("city")]
    CitySearch.should_receive(:find).with("some location").and_return(cities)
    
    post :index, :location => "some location"
    
    assigns[:cities].should == cities
  end
  
end
