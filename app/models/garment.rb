class Garment
  attr_reader :garment, :display_text

  def initialize(garment, display_text)
    @garment = garment
    @display_text = display_text
  end

  ESKIMO_HAT = new("eskimo_hat", "Eskimo Hat") unless defined?(ESKIMO_HAT)
  AMULET = new("amulet", "Ruby Amulet") unless defined?(AMULET) 
  SNOW_SUIT = new("snowsuit", "Snow Suit") unless defined?(SNOW_SUIT)
  USHANKA = new("ushanka", "Avoid red ears") unless defined?(USHANKA)
  SCARF = new("scarf", "Scarf") unless defined?(SCARF)
  FUR_COAT = new("fur_coat", "Fur Coat") unless defined?(FUR_COAT)
  DIVE_HELMET = new("dive_helmet", "Dive Helmet") unless defined?(DIVE_HELMET)
  DIVE_HELMET_NECK = new("dive_helmet_neck", "Dive Helmet") unless defined?(DIVE_HELMET_NECK)
  WET_SUIT = new("wetsuit", "Wet Suit") unless defined?(WET_SUIT)
  EAR_MUFFS = new("earmuffs", "Ear Muffs") unless defined?(EAR_MUFFS)
  COWBOY_HAT = new("cowboy_hat", "Cowboy Hat") unless defined?(COWBOY_HAT)
  BOMBER = new("bomber_jacket", "Bomber Jacket") unless defined?(BOMBER)
  CHAPS = new("chaps", "Leather Chaps") unless defined?(CHAPS)
  RAIN_HAT = new("rain_hat", "Fisherman's Hat") unless defined?(RAIN_HAT)
  SUNGLASSES = new("sunglasses", "Aviators") unless defined?(SUNGLASSES)
  SEER_SUCKER = new("seersucker", "Seer Sucker Suit") unless defined?(SEER_SUCKER)
  NRA = new("nra_hat", "NRA") unless defined?(NRA)
  ASCOT = new("ascot", "Polkadot Ascot") unless defined?(ASCOT)
  SPEEDO = new("speedo", "Speedo") unless defined?(SPEEDO)
  COKE = new("coke_glasses", "Shades") unless defined?(COKE)
  LOIN = new("loincloth", "Dainty Loin Cloth") unless defined?(LOIN)
  SOMBRERO = new("sombrero", "Sombrero") unless defined?(SOMBRERO)
end