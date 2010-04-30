class WeatherController < ApplicationController
  def display
    @weather = Weather.in(params[:id])
    @city_name = params[:city_name]
    
    if !@weather.valid?
      flash[:errors]= "No weather information for this location"
      redirect_to :controller => :home, :action => :index and return
    end
    
  end
end
