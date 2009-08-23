require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "home view spec" do
  it "should have an input for the location on index" do
    render :template => "home/index"
    
    response.should have_tag("form[action=/search]")
    response.should have_tag("input[type=text][name=location]")
    response.should have_tag("input[type=submit][value=search]")
  end
  
  it "should show city names" do
    # <a href="/blah?id=IAIAIA">Name</a>
    value = rand 1000
    assigns[:cities] = [mock("weather man 1", :name => "London #{value}", :id => "#{value}L"), 
                        mock("weather man 2", :name => "Chicago", :id => "#{value}C")
                        ]
    
    render :template => "home/index"
    
    response.body.should include("London #{value}")
    response.body.should include("Chicago")
    response.body.should have_tag("a[href=/weather/display/#{value}L?city_name=London+#{value}]")
  end
  
  it "should pass the city names in the link" do
    # <a href="/blah?id=IAIAIA">Name</a>
    value = rand 1000
    assigns[:cities] = [mock("weather man 1", :name => "London #{value}", :id => "#{value}L"), 
                        mock("weather man 2", :name => "Chicago", :id => "#{value}C")
                        ]
    
    render :template => "home/index"
    
    response.body.should include("London #{value}")
    response.body.should include("Chicago")
    response.body.should have_tag("a[href=/weather/display/#{value}L?city_name=London+#{value}]")
  end
  
  it "should show an error div" do
    flash[:errors] = "error message"
    
    render :template => "home/index"
    
    response.body.should have_tag("div[class=error_message]")
    response.body.should include("error message")
  end
  
  it "should not show an error div if the flash errors is not set" do
    flash[:errors] = nil
    
    render :template => "home/index"
    
    response.body.should_not have_tag("div[class=error_message]")
  end
end