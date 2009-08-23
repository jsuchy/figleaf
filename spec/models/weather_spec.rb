require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Weather do
  before(:each) do
    @weather_man = mock(WeatherMan)
    @current_conditions = mock(WeatherManCurrentConditions)
    @today = mock(WeatherManForecastDay)
    @forecast = mock(WeatherManForecast, :today => @today)

    @weather_man_response = mock(WeatherManResponse, :current_conditions => @current_conditions, :forecast => @forecast)
  end

  it "should return the weather for a given location id" do
    WeatherMan.should_receive(:new).with("UKXX0085").and_return(@weather_man)
    @weather_man.should_receive(:fetch).and_return(@weather_man_response)
    
    Weather.in("UKXX0085")
  end
  
  it "should return a new weather object" do
    WeatherMan.stub!(:new).and_return(@weather_man)
    @weather_man.stub!(:fetch).and_return(@weather_man_response)
    weather = mock(Weather)
    Weather.should_receive(:new).with(@weather_man_response).and_return(weather)
    
    Weather.in("blah").should == weather
  end
  
  describe "Temperature:" do
    describe "scales" do
      def temperature_should_feel_like(temperature, feels_like_symbol)
        @current_conditions.stub!(:feels_like).and_return(temperature)
        weather = Weather.new(@weather_man_response)
        weather.feels_like_description.should == feels_like_symbol
      end

      it "should feel like 70 degrees" do
        @weather_man_response.should_receive(:current_conditions).and_return(@current_conditions)
        @current_conditions.should_receive(:feels_like).and_return(70)

        weather = Weather.new(@weather_man_response)
        weather.feels_like_in_farenheit.should == 70
      end

      it "should calculate the temperature scale" do
        temperature_should_feel_like("32", :cold)
        temperature_should_feel_like("33", :chilly)
        temperature_should_feel_like("55", :chilly)
        temperature_should_feel_like("56", :warm)
        temperature_should_feel_like("79", :warm)
        temperature_should_feel_like("80", :hot)
      end
    end
    
    describe "high and low" do
      it "should tell us the low temperature" do
        @today.should_receive(:low).and_return(60)
        weather = Weather.new(@weather_man_response)
        weather.low.should == 60
      end

      it "should tell us the high temperature" do
        @today.should_receive(:high).and_return(80)
        weather = Weather.new(@weather_man_response)
        weather.high.should == 80
      end
    end
  end
  describe "Wind:" do
    def wind_speed_should_map_to_description(speed, description_symbol)
      @wind.stub!(:speed).and_return(speed)
      weather = Weather.new(@weather_man_response)
      weather.wind_speed_description.should == description_symbol
    end
    
    before(:each) do
      @wind = mock(WeatherManWind)
      @current_conditions.stub!(:wind).and_return(@wind)
    end

    it "should tell us the wind speed" do
      @wind.should_receive(:speed).and_return("9")
      weather = Weather.new(@weather_man_response)
      weather.wind_speed.should == 9
    end
    
    describe "scales" do
      it "should calculate the wind scale" do
        wind_speed_should_map_to_description("10", :calm)
        wind_speed_should_map_to_description("11", :breezy)
        wind_speed_should_map_to_description("30", :breezy)
        wind_speed_should_map_to_description("31", :windy)
      end
    end
  end
  
  describe "description" do
    def description_should_map_to_category(description, category_symbol)
      @current_conditions.stub!(:description).and_return(description)
      @weather.description_category.should == category_symbol
    end
    
    before(:each) do
      @weather = Weather.new(@weather_man_response)
    end
    
    it "should return the description" do
      @current_conditions.should_receive(:description).and_return("Mostly Cloudy")      
      @weather.description.should == "Mostly Cloudy"
    end
    
    it "should be sunny" do
      description_should_map_to_category("Sunny", :sunny)
      description_should_map_to_category("Partly Sunny", :sunny)
      description_should_map_to_category("Sunny Maybe", :sunny)
      description_should_map_to_category("Mostly Clear", :sunny)
      description_should_map_to_category("Clear", :sunny)
    end
    
    it "should be cloudy" do
      description_should_map_to_category("Cloudy", :cloudy)
      description_should_map_to_category("Partly Cloudy", :cloudy)
      description_should_map_to_category("Mostly Cloudy", :cloudy)
      description_should_map_to_category("Cloudy Sometimes", :cloudy)
      description_should_map_to_category("Thunder in the Vicinity", :cloudy)
      description_should_map_to_category("Fair", :cloudy)
    end
    
    it "should be rainy" do
      description_should_map_to_category("Scattered T-Storms", :rainy)
      description_should_map_to_category("PM Showers", :rainy)
      description_should_map_to_category("Rain", :rainy)
      description_should_map_to_category("Showers", :rainy)
    end
    
    it "should be snowy" do
      description_should_map_to_category("Snow", :snowy)
      description_should_map_to_category("Rain / Snow", :snowy)
      description_should_map_to_category("Rain / Snow Showers", :snowy)
    end
    it "should default to sunny" do
      description_should_map_to_category("Fog", :cloudy)
      description_should_map_to_category("Mist", :cloudy)
    end
  end
end