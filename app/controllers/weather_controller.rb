class WeatherController < ApplicationController
  def display
    @weather = Weather.in(params[:id])
  end
end
