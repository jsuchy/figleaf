require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WeatherHelper do
  include WeatherHelper
  
  describe "image helpers" do
    before(:each) do
      @weather = mock("weather")
      @weather.stub!(:feels_like_description).and_return(:cold)
      @weather.stub!(:wind_speed_description).and_return(:calm)
      @weather.stub!(:description_category).and_return(:snowy)
    end
    
    it "should give me the head garment name for cold calm and sunny" do
      head_garment_for(@weather).should == "ushanka"
    end
    
    it "should give me the neck image name for cold calm and sunny" do
      neck_garment_for(@weather).should == "scarf"
    end
    
    it "should give me the body image name for cold calm and sunny" do
      body_garment_for(@weather).should == "fur_coat"
    end
    
    it "should convert the head image name to an image file name" do
      garment = head_garment_for(@weather)
      garment_image_for(@weather, "head").should == "head_#{garment}.png"
    end
    
    it "should convert the neck image name to an image file name" do
      garment = neck_garment_for(@weather)
      garment_image_for(@weather, "neck").should == "neck_#{garment}.png"
    end
    
    it "should convert the body image name to an image file name" do
      garment = body_garment_for(@weather)
      garment_image_for(@weather, "body").should == "body_#{garment}.png"
    end
    
    it "should not choose a garment image for unimplemented body sections" do
      garment_image_for(@weather, "foo").should == nil
    end
    
    it "should choose a blank garment image if none is specified" do
      @weather.stub!(:feels_like_description).and_return(:key_that_has_no_garment)
      garment_image_for(@weather, "head").should == "blank.png"
    end
  end
end
