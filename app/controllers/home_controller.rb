class HomeController < ApplicationController
  def index
    @homepage = true
    set_home_page_cities
  end
end
