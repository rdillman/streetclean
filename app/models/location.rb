class Location < ActiveRecord::Base
  belongs_to :user
  
  #update the location duh
  def updateloc(addr,block,streetname,direction,start,stop)
    self.addr = addr
    self.block_num = block
    self.streetname = streetname
    self.direction = direction
    self.start = start.to_s
    self.stop = stop.to_s
    self.updated_at = Time.now
    self.save!
  end
  
  #Makes a pretty text message to be rendered
  def pretty_string
    tstart = self.start.to_time
    tstop = self.stop.to_time
    str = "The next sweeping time for the "
    str << self.block_num.to_s
    str << " block of "
    str << self.streetname
    str <<" "
    str << self.direction.upcase
    str <<" is on "
    str << tstart.strftime("%A, %B %d from %I:%M%p ")
    str << tstop.strftime("until %I:%M%p.")
  end
  
end
