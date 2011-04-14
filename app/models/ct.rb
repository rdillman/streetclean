class Ct < ActiveRecord::Base
  has_many :blocks

  #Determines whether a given date is a SFDPW Holiday
  def is_holiday?(time)
    holidays = ["January 01","January 17","February 21","May 30","July 04","September 05","October 10","November 11","November 24","November 25","December 25"]
    if holidays.find{|x| x == time.strftime("%B %d")}
      return TRUE
    end
    return FALSE
  end

  #Sets warning if the street is currently being cleaned
  def self.set_warning(start, stop,now)
    if stop > now && start < now
      start = start + 0.000001
    end
    return start,stop
  end
    
    #Formats the next cleantime start and stop for public consumption
  def prepare_nt(nt,stop,now)
    stop = nt.strftime("%D")<<" "<<stop
    next_time = Array.new
    next_time << nt
    next_time << Chronic.parse(stop)
    return next_time
  end
    
    
  #Used to turn  the "Hol" days in a CT into actual dates (e.g. "January 1" for New Years)
  def self.get_next_holiday(now)
    smallest = 2.year
    next_hol = ""
    holidays = ["January 01","January 17","February 21","May 30","July 04","September 05","October 10","November 11","November 24","November 25","December 25"]
    
    holidays.each do |x|
      tmp = Chronic.parse(x)
      if (tmp-now) < smallest
        smallest = tmp-now
        next_hol = x
      end
    end
    return next_hol
  end
  
  #Returns true is a CT is cleaned on a holiday
  def holiday_clean?
    self.boolyuns.at(0) == 'T'
  end
  
  #Returns true if a CT is not repeated every week of the month 
  def non_weekly?
    self.boolyuns.from(1) != "TTTTT"
  end
  
  #Returns Chron parse of the start time
  def start_time
    Chronic.parse(self.wday+" at "+self.start)
  end
  
  #Returns Chron parse of a stop time
  def stop_time
    Chronic.parse(self.wday+" at "+self.stop)
  end
  
  #Figures out when the next non-weekly sweep for a CT is 
  def non_weekly_times(now)
    stop = self.stop
    this_month = 0
    next_time = nil
    while(next_time==nil)
      month = this_month.to_s
      month = Chronic.parse(month<<" months from now")
      month = month.strftime("%B")
  
      #If a non-weekly is swept on a day of the week - that next time is returned
      #Since this function moves in order chronologically it returns the first clean time that is after now
      if self.boolyuns[1] == 84
        next_time = Chronic.parse("1st "<<self.wday<<" in "<<month)
        next_time = self.chronify_other_weeks(next_time)
        if now < next_time && !is_holiday?(next_time)
            return self.prepare_nt(next_time,stop,now)
        end
      end
      if self.boolyuns[2] == 84
        next_time = Chronic.parse("2nd "<<self.wday<<" in "<<month)
        next_time = self.chronify_other_weeks(next_time)
        if now < next_time &&!is_holiday?(next_time)
            return self.prepare_nt(next_time,stop,now)
        end
      end
      if self.boolyuns[3] == 84
        next_time = Chronic.parse("3rd "<<self.wday<<" in "<<month)
        next_time = self.chronify_other_weeks(next_time)
        if now < next_time && !is_holiday?(next_time)
            return self.prepare_nt(next_time,stop,now)
        end
      end
      if self.boolyuns[4] == 84
        next_time = Chronic.parse("4th "<<self.wday<<" in "<<month)
        next_time = self.chronify_other_weeks(next_time)
        if now < next_time && !is_holiday?(next_time)
            return self.prepare_nt(next_time,stop,now)
        end
      end
      if self.boolyuns[5] == 84
        next_time = Chronic.parse("5th "+self.wday+" in "+month)
        next_time = self.chronify_other_weeks(next_time)
        if now < next_time && !is_holiday?(next_time)
            return self.prepare_nt(next_time,stop,now)
        end
      end
      next_time = nil 
      months += 1
    end
  end
  
  #Helper Function for
  def chronify_other_weeks(next_time)
    next_time_str = next_time.strftime("%D")
    next_time = Chronic.parse(next_time_str<<" "<<self.start)
  end

  
  def self.warning?(next_time)
    if next_time[0].usec == 1
    end
  end
      
  #This function returns the start and stop times of the next clean time as time object
  def next_time
    now = Time.now
    start = self.start_time
    stop = self.stop_time 
    
    #Replace "HOL" value with next holiday
    if (self.wday == "HOL")
      hol = self.class.get_next_holiday(now)
      start = Chronic.parse(hol<<" "<<self.start)
      stop =  Chronic.parse(hol<<" "<<self.stop)
    end
    
    if self.non_weekly? == false
      #TBD - Add Warning Flag
      if start.wday == now.wday && ((stop-1.week) > now)
        start -= 1.week
        stop -= 1.week
      end
      
      #In case the next clean day is a holiday
      if self.holiday_clean? == false
        while is_holiday?(start)
          start += 1.week
          stop += 1.week
        end
      end

    else
        start,stop = self.non_weekly_times(now)
    end
              
    start, stop = self.class.set_warning(start,stop,now)
    return start,stop
  end
end