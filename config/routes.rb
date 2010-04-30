ActionController::Routing::Routes.draw do |map|
  map.root :controller => "home"

  map.display_weather 'weather/display/:id/:city_name', :controller => 'weather', :action => 'display'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
