class Garment
  attr_reader :garment, :display_text

  def initialize(garment, display_text)
    @garment = garment
    @display_text = display_text
  end

  ESKIMO_HAT = new("eskimo_hat", "Brrrr!") unless defined?(ESKIMO_HAT)
  AMULET = new("amulet", "Ruby Amulet!") unless defined?(AMULET) 
  SNOW_SUIT = new("snowsuit", "Swagsicle!") unless defined?(SNOW_SUIT)
  USHANKA = new("ushanka", "Avoid red ears!") unless defined?(USHANKA)
  SCARF = new("scarf", "") unless defined?(SCARF)
  FUR_COAT = new("fur_coat", "") unless defined?(FUR_COAT)
  DIVE_HELMET = new("dive_helmet", "Ready for anything!") unless defined?(DIVE_HELMET)
  DIVE_HELMET_NECK = new("dive_helmet_neck", "") unless defined?(DIVE_HELMET_NECK)
  WET_SUIT = new("wetsuit", "Dive in!") unless defined?(WET_SUIT)
  EAR_MUFFS = new("earmuffs", "Chilly willy!") unless defined?(EAR_MUFFS)
  COWBOY_HAT = new("cowboy_hat", "Stick 'em up!") unless defined?(COWBOY_HAT)
  BOMBER = new("bomber_jacket", "I look good in leather!") unless defined?(BOMBER)
  CHAPS = new("chaps", "Mount up!") unless defined?(CHAPS)
  RAIN_HAT = new("rain_hat", "Guess who I did last summer!") unless defined?(RAIN_HAT)
  SUNGLASSES = new("sunglasses", "Danger zone!") unless defined?(SUNGLASSES)
  SEER_SUCKER = new("seersucker", "Mint Julep anyone?") unless defined?(SEER_SUCKER)
  NRA = new("nra_hat", "Read, aim, shoot!") unless defined?(NRA)
  ASCOT = new("ascot", "Polkadot ascot!") unless defined?(ASCOT)
  SPEEDO = new("speedo", "Takin' a dip!") unless defined?(SPEEDO)
  COKE = new("coke_glasses", "Cool as ice!") unless defined?(COKE)
  LOIN = new("loincloth", "Dainty!") unless defined?(LOIN)
  SOMBRERO = new("sombrero", "En fuego!") unless defined?(SOMBRERO)
  BARE = new("bare", "")
  HANDKERCHIEF = new ("handkerchief", "Okies beware!")
  DOG_TAGS = new("dog_tags", "Charge!")
  SHORTS = new("shorts", "Running with the devil!")
end