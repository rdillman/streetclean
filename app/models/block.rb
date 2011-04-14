class Block < ActiveRecord::Base
  belongs_to :ct
  belongs_to :nhood
  belongs_to :street
  
end
