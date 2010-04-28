require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HomeController do
  
  it "should set homepage state" do
    get :index
    
    assigns[:homepage].should == true
  end
  
  
  # failing iphone tests - remove application_controller's responds_to_iphone call to make these fail
  it "sets the format to iphone" do
    setup_iphone_request
    
    get :index
    
    request.parameters["format"].should == "iphone"
  end
  
  it "renders iphone index for iPhone" do
    setup_iphone_request
    
    get :index
    
    response.should render_template("index.iphone.erb")
  end
  
  it "renders iphone index for Mobile Safari" do
    setup_mobile_safari_request
    
    get :index

    response.should render_template("index.iphone.erb")
  end
  
end
