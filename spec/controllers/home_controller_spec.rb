require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HomeController do
  it "should set homepage state" do
    get :index
    
    assigns[:homepage].should == true
  end

end
