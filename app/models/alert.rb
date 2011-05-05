class Alert < ActiveRecord::Base
  belongs_to :user
  belongs_to :ct
  
  def self.
  
  def self.send_all_alarms
    alarms = Alert.all
    now = Time.now
    alarms.each do |x|
      time = Chronic.parse(x.send_time)
      if(time-now < 5.minutes)
        UserMailer.send_alert(x).deliver
        x.destroy
      end
    end
  end
  
  def set_alarm(loc)
     self.location = "the "<<loc.block_num.to_s<<" block of "<<loc.streetname<<" "<<loc.direction
     self.clean_time = loc.start
     stime = Chronic.parse(self.clean_time) - 1.hour
     self.send_time = stime.strftime("%D %H:%M")
     self.user_id = loc.user_id
     self.save
  end
  
  
  def alarm_message
    next_time = Chronic.parse(self.clean_time)
    warning ="WARNING! "
    warning << self.location
    warning << " will be swept in one hour - TheTicketCricket"
  end
  
  def create_message
    next_time = Chronic.parse(self.clean_time)
    message = "An alarm has been created for next street sweep of "
    message << self.location
    message <<" which begins at "
    message << next_time.strftime("%I:%M%p.")
    message2 = "Your alarm will be sent one hour before the start time."
    return message, message2
  end
  
end
