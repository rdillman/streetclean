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
  def html_pretty_string
    tstart = self.start.to_time
    tstop = self.stop.to_time
    str1 = "BLOCK      : "
    str1 << self.block_num.to_s
    str1 << " block of "
    str1 << self.streetname
    str1 << " "
    str1 << self.direction.upcase
    str2 = "NEXT CLEAN : "
    str2 << tstart.strftime("%A, %B %d at %I:%M%p ")
    #str2 << tstop.strftime("until %I:%M%p.")
    return str1, str2
  end
end
  

