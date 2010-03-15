class WeatherController < ApplicationController
  def display
    @weather = Weather.in(params[:id])
    @city_name = params[:city_name]
    
    if @weather.valid?
      respond_to do |format|
        format.html
        format.iphone { render_iphone_display }
      end
    else
      flash[:errors]= "No weather information for this location"
      redirect_to :controller => :home, :action => :index and return
    end
    
  end
  
  def render_iphone_display
    render :inline => "<div id='weather'>
  <div class='toolbar'>
    <a class='back'>Back</a>
    <h1>#{@city_name}</h1>
  </div>
</div>"
  end
end
