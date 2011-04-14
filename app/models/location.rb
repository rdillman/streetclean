class Location < ActiveRecord::Base
  belongs_to :user
  
  #update the location duh
  def update(addr,block,streetname,direction,start,stop)
    self.addr = addr
    self.block_num = block
    self.streetname = streetname
    self.direction = direction
    self.start = start
    self.stop = stop
    self.updated_at = Time.now  
  end
  
  #Makes a pretty text message to be rendered
  def pretty_string
    str = "The next sweeping time for the "
    str << self.block_num.to_s
    str << " block of "
    str << self.streetname
    str <<" "
    str << self.direction.upcase
    str <<" is on "
    str << self.start.strftime("%A, %B %d from %I:%M%p ")
    str << self.stop.strftime("until %I:%M%p.")
  end
  
end
