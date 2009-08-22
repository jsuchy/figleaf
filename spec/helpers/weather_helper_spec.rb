require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WeatherHelper do
  include WeatherHelper
  
  describe "image helpers" do
    before(:each) do
      @weather = mock("weather")
    end
    
    it "should give me the head image for cold calm and sunny" do
      @weather.stub!(:feels_like_description).and_return(:cold)
      @weather.stub!(:wind_speed_description).and_return(:calm)
      @weather.stub!(:description_category).and_return(:sunny)
      head_image_for(@weather).should == "ushanka"
    end
    
    it "should give me the neck image for cold calm and sunny" do
      @weather.stub!(:feels_like_description).and_return(:cold)
      @weather.stub!(:wind_speed_description).and_return(:calm)
      @weather.stub!(:description_category).and_return(:snowy)
      neck_image_for(@weather).should == "scarf"
    end
    
    it "should give me the body image for cold calm and sunny" do
      @weather.stub!(:feels_like_description).and_return(:cold)
      @weather.stub!(:wind_speed_description).and_return(:calm)
      @weather.stub!(:description_category).and_return(:sunny)
      body_image_for(@weather).should == "snow_suit"
    end
  end
end
