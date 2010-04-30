require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HomeController do
  
  it "should set homepage state" do
    get :index
    
    assigns[:homepage].should == true
  end
  
  it "does not set format to iphone for non-iphone request" do
    get :index
    
    request.parameters["format"].should be_nil
  end
    
  it "sets the format to iphone" do
    # See spec/support/iphone.rb for the definition of this helper method
    pending
    setup_iphone_request
    
    get :index
    
    request.parameters["format"].should == "iphone"
  end
  
  it "sets the format for Mobile Safari" do
    pending
    setup_mobile_safari_request
    
    get :index
    
    request.parameters["format"].should == "iphone"
  end
  
  it "renders iphone index for iPhone" do
    pending
    setup_iphone_request
    
    get :index
    
    response.should render_template("index.iphone.erb")
  end
  
end
