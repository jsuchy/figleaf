require "garment"

class Outfit
  
  def self.find(weather)
    @@outfits.each do |outfit|
      return outfit if outfit.match_for?(weather)
    end
    return nil
  end
  
  attr_reader :temp, :wind, :prec, :details

  def initialize(temp, wind, prec, details)
    @temp = temp
    @wind = wind
    @prec = prec
    @details = details
  end
  
  def match_for?(weather)
    return false unless weather.wind == @wind
    return false unless weather.temp == @temp
    return false unless weather.prec == @prec
    return true
  end
  
  def head
    return @details[:head]
  end
  
  def neck
    return @details[:neck]
  end
  
  def body
    return @details[:body]
  end

  @@outfits = []
  
  def self.outfit_for(temp, wind, prec, details)
    @@outfits << new(temp, wind, prec, details)
  end

  outfit_for :cold, :calm, :sunny,      {:head => Garment::ESKIMO_HAT, :neck => Garment::AMULET, :body =>  Garment::SNOW_SUIT}
  outfit_for :cold, :calm, :cloudy,     {:head => Garment::USHANKA, :neck => Garment::AMULET, :body =>  Garment::FUR_COAT}
  outfit_for :cold, :calm, :snowy,      {:head => Garment::USHANKA, :neck => Garment::SCARF, :body =>  Garment::FUR_COAT}
  outfit_for :cold, :calm, :rainy,      {:head => Garment::DIVE_HELMET, :neck => Garment::DIVE_HELMET_NECK, :body =>  Garment::WET_SUIT}
  
  outfit_for :cold, :breezy, :sunny,    {:head => Garment::EAR_MUFFS, :neck => Garment::SCARF, :body =>  Garment::FUR_COAT}
  outfit_for :cold, :breezy, :cloudy,   {:head => Garment::USHANKA, :neck => Garment::SCARF, :body =>  Garment::FUR_COAT}
  outfit_for :cold, :breezy, :snowy,    {:head => Garment::USHANKA, :neck => Garment::SCARF, :body =>  Garment::SNOW_SUIT}
  outfit_for :cold, :breezy, :rainy,    {:head => Garment::DIVE_HELMET, :neck => Garment::DIVE_HELMET_NECK, :body =>  Garment::WET_SUIT}
  
  outfit_for :cold, :windy, :sunny,     {:head => Garment::USHANKA, :neck => Garment::SCARF, :body =>  Garment::SNOW_SUIT}
  outfit_for :cold, :windy, :cloudy,    {:head => Garment::ESKIMO_HAT, :neck => Garment::SCARF, :body =>  Garment::FUR_COAT}
  outfit_for :cold, :windy, :snowy,     {:head => Garment::USHANKA, :neck => Garment::SCARF, :body =>  Garment::SNOW_SUIT}
  outfit_for :cold, :windy, :rainy,     {:head => Garment::DIVE_HELMET, :neck => Garment::DIVE_HELMET_NECK, :body =>  Garment::WET_SUIT}
  
  
  outfit_for :chilly, :calm, :sunny,    {:head => Garment::COWBOY_HAT, :neck => Garment::AMULET, :body =>  Garment::SEER_SUCKER}
  outfit_for :chilly, :calm, :cloudy,   {:head => Garment::COWBOY_HAT, :neck => Garment::DOG_TAGS, :body =>  Garment::CHAPS}
  outfit_for :chilly, :calm, :snowy,    {:head => Garment::ESKIMO_HAT, :neck => Garment::SCARF, :body =>  Garment::CHAPS}
  outfit_for :chilly, :calm, :rainy,    {:head => Garment::RAIN_HAT, :neck => Garment::AMULET, :body =>  Garment::WET_SUIT}

  outfit_for :chilly, :breezy, :sunny,  {:head => Garment::EAR_MUFFS, :neck => Garment::AMULET, :body =>  Garment::BOMBER}
  outfit_for :chilly, :breezy, :cloudy, {:head => Garment::EAR_MUFFS, :neck => Garment::AMULET, :body =>  Garment::BOMBER}
  outfit_for :chilly, :breezy, :snowy,  {:head => Garment::USHANKA, :neck => Garment::SCARF, :body =>  Garment::SNOW_SUIT}
  outfit_for :chilly, :breezy, :rainy,  {:head => Garment::RAIN_HAT, :neck => Garment::BARE, :body =>  Garment::WET_SUIT}

  outfit_for :chilly, :windy, :sunny,   {:head => Garment::EAR_MUFFS, :neck => Garment::AMULET, :body =>  Garment::SEER_SUCKER}
  outfit_for :chilly, :windy, :cloudy,  {:head => Garment::COWBOY_HAT, :neck => Garment::SCARF, :body =>  Garment::BOMBER}
  outfit_for :chilly, :windy, :snowy,   {:head => Garment::USHANKA, :neck => Garment::SCARF, :body =>  Garment::SNOW_SUIT}
  outfit_for :chilly, :windy, :rainy,   {:head => Garment::DIVE_HELMET, :neck => Garment::DIVE_HELMET_NECK, :body =>  Garment::WET_SUIT}
  
  
  outfit_for :warm, :calm, :sunny,      {:head => Garment::SUNGLASSES, :neck => Garment::BARE, :body =>  Garment::SEER_SUCKER}
  outfit_for :warm, :calm, :cloudy,     {:head => Garment::NRA, :neck => Garment::ASCOT, :body =>  Garment::SHORTS}
  outfit_for :warm, :calm, :snowy,      {:head => Garment::DIVE_HELMET, :neck => Garment::SCARF, :body =>  Garment::SNOW_SUIT}
  outfit_for :warm, :calm, :rainy,      {:head => Garment::RAIN_HAT, :neck => Garment::ASCOT, :body =>  Garment::SEER_SUCKER}
              
  outfit_for :warm, :breezy, :sunny,    {:head => Garment::SUNGLASSES, :neck => Garment::BARE, :body =>  Garment::SEER_SUCKER}
  outfit_for :warm, :breezy, :cloudy,   {:head => Garment::NRA, :neck => Garment::AMULET, :body =>  Garment::SHORTS}
  outfit_for :warm, :breezy, :snowy,    {:head => Garment::COWBOY_HAT, :neck => Garment::ASCOT, :body =>  Garment::SNOW_SUIT}
  outfit_for :warm, :breezy, :rainy,    {:head => Garment::RAIN_HAT, :neck => Garment::DOG_TAGS, :body =>  Garment::SHORTS}
              
  outfit_for :warm, :windy, :sunny,     {:head => Garment::SUNGLASSES, :neck => Garment::ASCOT, :body =>  Garment::SEER_SUCKER}
  outfit_for :warm, :windy, :cloudy,    {:head => Garment::NRA, :neck => Garment::HANDKERCHIEF, :body =>  Garment::SEER_SUCKER}
  outfit_for :warm, :windy, :snowy,     {:head => Garment::COWBOY_HAT, :neck => Garment::HANDKERCHIEF, :body =>  Garment::SNOW_SUIT}
  outfit_for :warm, :windy, :rainy,     {:head => Garment::DIVE_HELMET, :neck => Garment::DIVE_HELMET_NECK, :body =>  Garment::WET_SUIT}
  
  
  outfit_for :hot, :calm, :sunny,       {:head => Garment::SUNGLASSES, :neck => Garment::AMULET, :body =>  Garment::SPEEDO}
  outfit_for :hot, :calm, :cloudy,      {:head => Garment::COKE, :neck => Garment::DOG_TAGS, :body =>  Garment::LOIN}
  outfit_for :hot, :calm, :snowy,       {:head => Garment::USHANKA, :neck => Garment::AMULET, :body =>  Garment::SPEEDO}
  outfit_for :hot, :calm, :rainy,       {:head => Garment::RAIN_HAT, :neck => Garment::DOG_TAGS, :body =>  Garment::LOIN}
                                        
  outfit_for :hot, :breezy, :sunny,     {:head => Garment::SOMBRERO, :neck => Garment::AMULET, :body =>  Garment::SPEEDO}
  outfit_for :hot, :breezy, :cloudy,    {:head => Garment::COKE, :neck => Garment::SOMBRERO, :body =>  Garment::SPEEDO}
  outfit_for :hot, :breezy, :snowy,     {:head => Garment::EAR_MUFFS, :neck => Garment::ASCOT, :body =>  Garment::SPEEDO}
  outfit_for :hot, :breezy, :rainy,     {:head => Garment::RAIN_HAT, :neck => Garment::ASCOT, :body =>  Garment::LOIN}
              
  outfit_for :hot, :windy, :sunny,      {:head => Garment::SUNGLASSES, :neck => Garment::AMULET, :body =>  Garment::SPEEDO}
  outfit_for :hot, :windy, :cloudy,     {:head => Garment::SUNGLASSES, :neck => Garment::HANDKERCHIEF, :body =>  Garment::SPEEDO}
  outfit_for :hot, :windy, :snowy,      {:head => Garment::EAR_MUFFS, :neck => Garment::SCARF, :body =>  Garment::SPEEDO}
  outfit_for :hot, :windy, :rainy,      {:head => Garment::RAIN_HAT, :neck => Garment::DOG_TAGS, :body =>  Garment::LOIN}
  
  
end
