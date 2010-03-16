# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  # responds_to_iphone!   # always render iphone templates
  responds_to_iphone  # only render iphone templates if user agent is Mobile Safari
  
  WeatherMan.partner_id = '1133672529'
  WeatherMan.license_key = 'ecb7aeada0996650'
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
