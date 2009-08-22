class SearchController < ApplicationController
  def index
    @cities = CitySearch.find(params[:location])
    if @cities.size == 1
      redirect_to(:controller => :weather, :action => :display, :id => params[:location])
    elsif
      render :template => 'home/index' 
    end
  end
end
