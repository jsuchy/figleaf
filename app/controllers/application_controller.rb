# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  responds_to_iphone  # only render iphone templates if user agent is Mobile Safari
  # responds_to_iphone! # always render iphone templates, e.g. if you can't change this in your browswer
  
  WeatherMan.partner_id = '1133672529'
  WeatherMan.license_key = 'ecb7aeada0996650'
  
  def set_home_page_cities
    @home_page_cities = { "Bangkok, Thailand" => "THXX0002", 
                          "Boshof, South Africa" => "SFXX0009", 
                          "Cairo, Egypt" => "EGXX0004", 
                          "Chicago, IL" => "USIL0225", 
                          "Lima, Peru" => "PEXX0011", 
                          "London, United Kingdom" => "UKXX0085", 
                          "Moscow, Russia" => "RSXX0063",
                          "New York, NY" => "USNY0996", 
                          "Sydney, Australia" => "ASXX0112", 
                          "Tokyo, Japan" => "JAXX0085", 
                          "Vancouver, Canada" => "CAXX0518"}.sort
    
  end
end
