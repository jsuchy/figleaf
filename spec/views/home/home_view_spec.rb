require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "home view spec" do
  it "should have an input for the location on index" do
    render :template => "home/index"
    
    response.should have_tag("form[action=/search]")
    response.should have_tag("input[type=text][name=location][value=Zip Code/ City, State]")
    response.should have_tag("input[type=submit][value=search]")
  end
  
  it "should show city names" do
    # <a href="/blah?id=IAIAIA">Name</a>
    value = rand 1000
    assigns[:cities] = [mock("weather man 1", :name => "London #{value}"), mock("weather man 2", :name => "Chicago")]
    
    render :template => "home/index"
    
    response.body.should include("London #{value}")
    response.body.should include("Chicago")
  end

end