class LocationsController < ApplicationController
  def locate_car
    
  end
  
  def process_address
    @current_address = params[:address]
  end

  # models/locations.rb
  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

end
