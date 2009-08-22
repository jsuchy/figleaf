module WeatherHelper
  def head_image_for(weather)
    head_images = {:cold_calm_sunny => "ushanka", :cold_calm_cloudy => "ushanka", :cold_calm_snowy => "ushanka",
                   :cold_calm_rainy => "dive_helmet", :cold_breezy_sunny => "ushanka", :cold_breezy_cloudy => "ushanka",
                   :cold_breezy_snowy => "ushanka", :cold_breezy_rainy => "dive_helmet", :cold_windy_sunny => "ushanka",
                   :cold_windy_cloudy => "ushanka", :cold_windy_snowy => "ushanka", :cold_windy_rainy => "dive_helmet",

                   :chilly_calm_sunny => "ushanka", :chilly_calm_cloudy => "ushanka", :chilly_calm_snowy => "ushanka",
                   :chilly_calm_rainy => "dive_helmet", :chilly_breezy_sunny => "ushanka", :chilly_breezy_cloudy => "ushanka",
                   :chilly_breezy_snowy => "ushanka", :chilly_breezy_rainy => "dive_helmet", :chilly_windy_sunny => "ushanka",
                   :chilly_windy_cloudy => "ushanka", :chilly_windy_snowy => "ushanka", :chilly_windy_rainy => "dive_helmet",
                   
                   :warm_calm_sunny => "ushanka", :warm_calm_cloudy => "ushanka", :warm_calm_snowy => "ushanka",
                   :warm_calm_rainy => "dive_helmet", :warm_breezy_sunny => "ushanka", :warm_breezy_cloudy => "ushanka",
                   :warm_breezy_snowy => "ushanka", :warm_breezy_rainy => "dive_helmet", :warm_windy_sunny => "ushanka",
                   :warm_windy_cloudy => "ushanka", :warm_windy_snowy => "ushanka", :warm_windy_rainy => "dive_helmet",
                   
                   :hot_calm_sunny => "ushanka", :hot_calm_cloudy => "ushanka", :hot_calm_snowy => "ushanka",
                   :hot_calm_rainy => "dive_helmet", :hot_breezy_sunny => "ushanka", :hot_breezy_cloudy => "ushanka",
                   :hot_breezy_snowy => "ushanka", :hot_breezy_rainy => "dive_helmet", :hot_windy_sunny => "ushanka",
                   :hot_windy_cloudy => "ushanka", :hot_windy_snowy => "ushanka", :hot_windy_rainy => "dive_helmet"}
    return head_images[lookup_symbol(weather)]
  end
  
  def neck_image_for(weather)
    neck_images = {:cold_calm_sunny => nil, :cold_calm_cloudy => nil, :cold_calm_snowy => "scarf",
                   :cold_calm_rainy => nil, :cold_breezy_sunny => "scarf", :cold_breezy_cloudy => "scarf",
                   :cold_breezy_snowy => "scarf", :cold_breezy_rainy => nil, :cold_windy_sunny => "scarf",
                   :cold_windy_cloudy => "scarf", :cold_windy_snowy => "scarf", :cold_windy_rainy => nil,

                   :chilly_calm_sunny => nil, :chilly_calm_cloudy => nil, :chilly_calm_snowy => "scarf",
                   :chilly_calm_rainy => nil, :chilly_breezy_sunny => nil, :chilly_breezy_cloudy => nil,
                   :chilly_breezy_snowy => "scarf", :chilly_breezy_rainy => nil, :chilly_windy_sunny => nil,
                   :chilly_windy_cloudy => "scarf", :chilly_windy_snowy => "scarf", :chilly_windy_rainy => nil,
                   
                   :warm_calm_sunny => nil, :warm_calm_cloudy => "ascot", :warm_calm_snowy => nil,
                   :warm_calm_rainy => "ascot", :warm_breezy_sunny => nil, :warm_breezy_cloudy => "ascot",
                   :warm_breezy_snowy => "ascot", :warm_breezy_rainy => "scarf", :warm_windy_sunny => "ascot",
                   :warm_windy_cloudy => "ascot", :warm_windy_snowy => "scarf", :warm_windy_rainy => nil,
                   
                   :hot_calm_sunny => "bare", :hot_calm_cloudy => "bare", :hot_calm_snowy => "bare",
                   :hot_calm_rainy => "bare", :hot_breezy_sunny => "bare", :hot_breezy_cloudy => "bare",
                   :hot_breezy_snowy => "ascot", :hot_breezy_rainy => "ascot", :hot_windy_sunny => "bare",
                   :hot_windy_cloudy => "bare", :hot_windy_snowy => "scarf", :hot_windy_rainy => "scarf"}
    return neck_images[lookup_symbol(weather)]
  end
  
  def body_image_for(weather)
    body_images = {:cold_calm_sunny => "snow_suit", :cold_calm_cloudy => "snow_suit", :cold_calm_snowy => "snow_suit",
                   :cold_calm_rainy => "wet_suit", :cold_breezy_sunny => "snow_suit", :cold_breezy_cloudy => "snow_suit",
                   :cold_breezy_snowy => "snow_suit", :cold_breezy_rainy => "wet_suit", :cold_windy_sunny => "snow_suit",
                   :cold_windy_cloudy => "snow_suit", :cold_windy_snowy => "snow_suit", :cold_windy_rainy => "wet_suit",

                   :chilly_calm_sunny => "bomber", :chilly_calm_cloudy => "chaps", :chilly_calm_snowy => "snow_suit",
                   :chilly_calm_rainy => "wet_suit", :chilly_breezy_sunny => "bomber", :chilly_breezy_cloudy => "bomber",
                   :chilly_breezy_snowy => "snow_suit", :chilly_breezy_rainy => "wet_suit", :chilly_windy_sunny => "bomber",
                   :chilly_windy_cloudy => "bomber", :chilly_windy_snowy => "snow_suit", :chilly_windy_rainy => "wet_suit",
                   
                   :warm_calm_sunny => "chaps", :warm_calm_cloudy => "chaps", :warm_calm_snowy => "snow_suit",
                   :warm_calm_rainy => "poncho", :warm_breezy_sunny => "bomber", :warm_breezy_cloudy => "chaps",
                   :warm_breezy_snowy => "snow_suit", :warm_breezy_rainy => "poncho", :warm_windy_sunny => "chaps",
                   :warm_windy_cloudy => "bomber", :warm_windy_snowy => "snow_suit", :warm_windy_rainy => "wet_suit",
                   
                   :hot_calm_sunny => "speedo", :hot_calm_cloudy => "speedo", :hot_calm_snowy => "speedo",
                   :hot_calm_rainy => "speedo", :hot_breezy_sunny => "speedo", :hot_breezy_cloudy => "speedo",
                   :hot_breezy_snowy => "speedo", :hot_breezy_rainy => "speedo", :hot_windy_sunny => "speedo",
                   :hot_windy_cloudy => "speedo", :hot_windy_snowy => "speedo", :hot_windy_rainy => "speedo"}
    return body_images[lookup_symbol(weather)]
  end
  
  
  private
  
  def lookup_symbol(weather)
    return "#{weather.feels_like_description}_#{weather.wind_speed_description}_#{weather.description_category}".to_sym
  end
end
