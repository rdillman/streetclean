class Users < ActiveRecord::Base
  has_many :vehicles
  has_one :locations
    
  
end
