class Alert < ActiveRecord::Base
  belongs_to :user
  belongs_to :ct
  
  def set_alarm(loc)
     self.location = "The"<<loc.block_num.to_s<<" block of "<<loc.streetname<<" "<<loc.direction
     self.clean_time = loc.start
     self.send_time = self.clean_time.to_time - 1.hour
     #self.user_id = current_user.id
  end
  
  
  def alarm_message
    warning ="WARNING"
    warning << self.location
    warning << " will be swept in one hour, starting at "
    warning << self.clean_time
  end
  
end
