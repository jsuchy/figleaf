module WeatherHelper
    
  def garment_image_for(weather, body_section)
    return nil unless ["head", "neck", "body"].include?(body_section)
    garment = send("#{body_section}_garment_for", weather)
    if garment
      return "#{body_section}_#{garment}.png"
    else
      return "blank.png"
    end
  end
  
  private
  
  def head_garment_for(weather)
    head_images = {:cold_calm_sunny => "eskimo", :cold_calm_cloudy => "ushanka", :cold_calm_snowy => "ushanka",
                   :cold_calm_rainy => "dive_helmet", :cold_breezy_sunny => "ear_muffs", :cold_breezy_cloudy => "ushanka",
                   :cold_breezy_snowy => "ushanka", :cold_breezy_rainy => "dive_helmet", :cold_windy_sunny => "ushanka",
                   :cold_windy_cloudy => "eskimo", :cold_windy_snowy => "ushanka", :cold_windy_rainy => "dive_helmet",

                   :chilly_calm_sunny => "cowboy_hat", :chilly_calm_cloudy => "cowboy_hat", :chilly_calm_snowy => "eskimo",
                   :chilly_calm_rainy => "amulet", :chilly_breezy_sunny => "ear_muffs", :chilly_breezy_cloudy => "eskimo",
                   :chilly_breezy_snowy => "ushanka", :chilly_breezy_rainy => "rain_hat", :chilly_windy_sunny => "ear_muffs",
                   :chilly_windy_cloudy => "cowboy_hat", :chilly_windy_snowy => "ushanka", :chilly_windy_rainy => "dive_helmet",
                   
                   :warm_calm_sunny => "sunglasses", :warm_calm_cloudy => "cowboy_hat", :warm_calm_snowy => "dive_helmet",
                   :warm_calm_rainy => "rain_hat", :warm_breezy_sunny => "sunglasses", :warm_breezy_cloudy => "cowboy_hat",
                   :warm_breezy_snowy => "cowboy_hat", :warm_breezy_rainy => "rain_hat", :warm_windy_sunny => "sunglasses",
                   :warm_windy_cloudy => "nra_hat", :warm_windy_snowy => "cowboy_hat", :warm_windy_rainy => "dive_helmet",
                   
                   :hot_calm_sunny => "sunglasses", :hot_calm_cloudy => "coke_glasses", :hot_calm_snowy => "ushanka",
                   :hot_calm_rainy => "rain_hat", :hot_breezy_sunny => "sombrero", :hot_breezy_cloudy => "nra_hat",
                   :hot_breezy_snowy => "ear_muffs", :hot_breezy_rainy => "rain_hat", :hot_windy_sunny => "sunglasses",
                   :hot_windy_cloudy => "nra_hat", :hot_windy_snowy => "ear_muffs", :hot_windy_rainy => "rain_hat"}
    return head_images[lookup_symbol(weather)]
  end
  
  def neck_garment_for(weather)
    neck_images = {:cold_calm_sunny => "amulet", :cold_calm_cloudy => "amulet", :cold_calm_snowy => "scarf",
                   :cold_calm_rainy => nil, :cold_breezy_sunny => "scarf", :cold_breezy_cloudy => "scarf",
                   :cold_breezy_snowy => "scarf", :cold_breezy_rainy => nil, :cold_windy_sunny => "scarf",
                   :cold_windy_cloudy => "scarf", :cold_windy_snowy => "scarf", :cold_windy_rainy => nil,

                   :chilly_calm_sunny => "amulet", :chilly_calm_cloudy => "amulet", :chilly_calm_snowy => "scarf",
                   :chilly_calm_rainy => "amulet", :chilly_breezy_sunny => "amulet", :chilly_breezy_cloudy => "amulet",
                   :chilly_breezy_snowy => "scarf", :chilly_breezy_rainy => "amulet", :chilly_windy_sunny => "amulet",
                   :chilly_windy_cloudy => "scarf", :chilly_windy_snowy => "scarf", :chilly_windy_rainy => nil,
                   
                   :warm_calm_sunny => "amulet", :warm_calm_cloudy => "ascot", :warm_calm_snowy => "scarf",
                   :warm_calm_rainy => "ascot", :warm_breezy_sunny => "amulet", :warm_breezy_cloudy => "ascot",
                   :warm_breezy_snowy => "ascot", :warm_breezy_rainy => "scarf", :warm_windy_sunny => "ascot",
                   :warm_windy_cloudy => "ascot", :warm_windy_snowy => "scarf", :warm_windy_rainy => nil,
                   
                   :hot_calm_sunny => "amulet", :hot_calm_cloudy => "amulet", :hot_calm_snowy => "amulet",
                   :hot_calm_rainy => "amulet", :hot_breezy_sunny => "amulet", :hot_breezy_cloudy => "amulet",
                   :hot_breezy_snowy => "ascot", :hot_breezy_rainy => "ascot", :hot_windy_sunny => "amulet",
                   :hot_windy_cloudy => "amulet", :hot_windy_snowy => "scarf", :hot_windy_rainy => "scarf"}
    return neck_images[lookup_symbol(weather)]
  end
  
  def body_garment_for(weather)
    body_images = {:cold_calm_sunny => "snow_suit", :cold_calm_cloudy => "fur_coat", :cold_calm_snowy => "fur_coat",
                   :cold_calm_rainy => "wet_suit", :cold_breezy_sunny => "fur_coat", :cold_breezy_cloudy => "fur_coat",
                   :cold_breezy_snowy => "snow_suit", :cold_breezy_rainy => "wet_suit", :cold_windy_sunny => "snow_suit",
                   :cold_windy_cloudy => "fur_coat", :cold_windy_snowy => "snow_suit", :cold_windy_rainy => "wet_suit",

                   :chilly_calm_sunny => "bomber_jacket", :chilly_calm_cloudy => "chaps", :chilly_calm_snowy => "fur_coat",
                   :chilly_calm_rainy => "wet_suit", :chilly_breezy_sunny => "bomber_jacket", :chilly_breezy_cloudy => "bomber_jacket",
                   :chilly_breezy_snowy => "snow_suit", :chilly_breezy_rainy => "wet_suit", :chilly_windy_sunny => "bomber_jacket",
                   :chilly_windy_cloudy => "bomber_jacket", :chilly_windy_snowy => "snow_suit", :chilly_windy_rainy => "wet_suit",
                   
                   :warm_calm_sunny => "seersucker", :warm_calm_cloudy => "chaps", :warm_calm_snowy => "snow_suit",
                   :warm_calm_rainy => "bomber_jacket", :warm_breezy_sunny => "seersucker", :warm_breezy_cloudy => "chaps",
                   :warm_breezy_snowy => "snow_suit", :warm_breezy_rainy => "bomber_jacket", :warm_windy_sunny => "seersucker",
                   :warm_windy_cloudy => "bomber_jacket", :warm_windy_snowy => "snow_suit", :warm_windy_rainy => "wet_suit",
                   
                   :hot_calm_sunny => "speedo", :hot_calm_cloudy => "loincloth", :hot_calm_snowy => "speedo",
                   :hot_calm_rainy => "loincloth", :hot_breezy_sunny => "speedo", :hot_breezy_cloudy => "loincloth",
                   :hot_breezy_snowy => "speedo", :hot_breezy_rainy => "loincloth", :hot_windy_sunny => "speedo",
                   :hot_windy_cloudy => "speedo", :hot_windy_snowy => "speedo", :hot_windy_rainy => "loincloth"}
    return body_images[lookup_symbol(weather)]
  end
  
  def lookup_symbol(weather)
    return "#{weather.feels_like_description}_#{weather.wind_speed_description}_#{weather.description_category}".to_sym
  end
end
