class Vehicles < ActiveRecord::Base
  belongs_to :users
  has_one :locations
  
  
end
