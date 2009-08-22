class SearchController < ApplicationController
  def index
    @cities = CitySearch.find(params[:location])
    render :template => 'home/index'
  end
end
