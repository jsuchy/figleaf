class WeatherController < ApplicationController
  def display
    @weather = Weather.in(params[:id])
    unless @weather.valid?
      flash[:errors]= "No weather information for this location"
      redirect_to :controller => :home, :action => :index
    end
  end
end
