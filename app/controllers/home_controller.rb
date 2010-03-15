class HomeController < ApplicationController
  def index
    @homepage = true
    
    @home_page_cities = { "Bangkok, Thailand" => "THXX0002", 
                          "Boshof, South Africa" => "SFXX0009", 
                          "Cairo, Egypt" => "EGXX0004", 
                          "Chicago, IL" => "USIL0225", 
                          "Lima, Peru" => "PEXX0011", 
                          "London, United Kingdom" => "UKXX0085", 
                          "New York, NY" => "USNY0996", 
                          "McMurdo, Antarctica" => "AYXX0010", 
                          "Sydney, Australia" => "ASXX0112", 
                          "Tokyo, Japan" => "JAXX0085", 
                          "Vancouver, Canada" => "CAXX0518"}.sort

    respond_to do |format|
      format.html
      format.iphone
    end
    
  end
end
