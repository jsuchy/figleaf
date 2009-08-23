require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HomeController do
  it "should set homepage state" do
    get :index
    
    assigns[:homepage].should == true
  end
  
  it "should have 10 sample cities" do
    get :index
    
    assigns[:sample_cities].should_not be_nil
    assigns[:sample_cities].size.should == 10
  end

end
