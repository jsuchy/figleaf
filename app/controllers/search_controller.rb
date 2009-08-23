class SearchController < ApplicationController
  def index
    @cities = CitySearch.find(params[:location])
    
    if @cities.empty?
      flash[:errors] = "No Matching results were found."
      redirect_to(:controller => :home, :action => :index)
    elsif @cities.size == 1
      redirect_to(:controller => :weather, :action => :display, :id => @cities.first.id)
    elsif
      flash.now[:errors]= "We found more than one city!"
      render :template => 'home/index'
    end
  end
end
