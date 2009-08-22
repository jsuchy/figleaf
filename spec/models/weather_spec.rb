require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Weather do
  before(:each) do
    @weather_man = mock(WeatherMan)
    @weather_man_response = mock(WeatherManResponse, :current_conditions => nil)
    @current_conditions = mock(WeatherManCurrentConditions)
    @weather_man_response.stub!(:current_conditions).and_return(@current_conditions)
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
        temperature_should_feel_like(32, :cold)
        temperature_should_feel_like(33, :chilly)
        temperature_should_feel_like(55, :chilly)
        temperature_should_feel_like(56, :nice)
        temperature_should_feel_like(79, :nice)
        temperature_should_feel_like(80, :hot)
      end
    end
    
    describe "high and low" do
      it "should tell us the low temperature" do
        @current_conditions.should_receive(:low).and_return(60)
        weather = Weather.new(@weather_man_response)
        weather.low.should == 60
      end

      it "should tell us the high temperature" do
        @current_conditions.should_receive(:high).and_return(80)
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
      weather.wind_speed.should == "9"
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
  
  it "shoudl give us a description for the day" do
    weather = Weather.new(@weather_man_response)

    #Cloudy, Sunny, Partly Cloudy, Mostly Cloudy, Fair, Mostly Clear, Clear, Scattered T-Storms
  end
end