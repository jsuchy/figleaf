class WeatherController < ApplicationController
  def display
    @character = PersonalAssistant.dress_for(Weather.in(params[:id]))
  end
end
