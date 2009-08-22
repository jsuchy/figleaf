class SearchController < ApplicationController
  def index
    @cities = WeatherManCaller.find_cities_for(params[:location])
    render :template => 'home/index'
  end
end
