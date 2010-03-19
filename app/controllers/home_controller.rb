class HomeController < ApplicationController
  def index
    @homepage = true
    set_home_page_cities
    respond_to do |format|
      format.html
      format.iphone
    end
    
  end
end
