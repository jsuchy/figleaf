require 'erb'

class WeatherController < ApplicationController
  def display
    @weather = Weather.in(params[:id])
    @city_name = params[:city_name]
    
    if @weather.valid?
      respond_to do |format|
        format.html
        format.iphone do
          render_iphone_display
        end
      end
    else
      flash[:errors]= "No weather information for this location"
      redirect_to :controller => :home, :action => :index and return
    end
    
  end
  
  private #################################################
  
  def render_iphone_display
    template = ERB.new(File.read("app/views/weather/display.iphone.erb"))
    render :inline => template.result(binding)
  end
end
