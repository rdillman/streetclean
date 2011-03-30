class ApplicationController < ActionController::Base
  
  
  
  
  
  

  private #-------------------------------------------------------HELPER METHODS 
  
  # This function determines the next street cleaning time from an array of activeRecord database responses
  # --WARNING-- This function aint equipped to deal w/ holidays,every-other-week streets, or 
  # or same day requests...yet
    def get_next_time(results)
    
      now = Time.now
      current_flag = nil
      holiday_flag = nil
      best = nil
      
      hol = holiday?(now)
      
      #Create copy of records in order to manipulate the dates---------------
      copy = create_copy(results,now)
     
      #Same-day Test---------------------------------------------------------
      same = copy.find{|x| x.bottomr == 0}
      # if there is a day at the same time
      
      if same
        same, current_flag = same_day_alterations(same,now,current_flag)
      end
    
      copy.each do |x|
        while holiday?(x.streetname) and cleaned_on_holidays?(x) == FALSE
          add_n_weeks(x,1)
        end
      end
      
      best = copy.min_by{|x|x.topl}
      very_best = results.find{|x|x.id == best.id}
      very_best.day = best.streetname
      return very_best, current_flag
    end
    
    
    #-------Change if Same Day
    
    def same_day_alterations(same, now, current_flag)
      if not_weekly?(same)
        #something
      else
        subtract_n_weeks(same,1)
      end
      if holiday?(now)
        if cleaned_on_holidays?(same) == FALSE
          add_n_weeks(same,1)
        end
      end
      if b4_ct?(same,now)
        current_flag = 1
      end
      if during_ct?(same,now)
        current_flag = -1
        add_n_weeks(same,1)
      end
      if after_ct?(same,now)
        add_n_weeks(same,1)
      end
      
      return same, current_flag
    end
    
    
    #-------Change if Every_Other_Week
    
    
    #-------change if Holiday
    
    
    
    
    #-------------------------------------------------
    def create_copy(mas,now)
      today_num = Time.now.wday
      copy = mas.clone
      copy.each do |x| 
        
        #Holiday Test--------------
        if x.day == "HOLIDAY"
          x.streetname = Chronic.parse(get_next_holiday(now)+" at "+x.start)
        else
          x.streetname = Chronic.parse(x.day+" at "+x.start)
        end
        
        #Format new columns -------
        x.rl = Chronic.parse("Today at "+x.finish)
        x.bottoml = x.streetname.wday
        x.topl = x.streetname - now  
        x.bottomr = x.bottoml - today_num
        x.start = Chronic.parse("Today at "+x.start)
      end
      
      
      return copy
    end
    

    
    
    #-------------------------------------------
    def get_next_holiday(now)
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
      
      
    
    #-------------------------------------------
    #For parsing the input and making it uppercase
    def split_input(str)
      str.upcase!
      return str.split
    end
  
    #-------------------------------------------
    # Figure out which side of the street
    def find_side(addr)
      if addr.even?
        return "R"
      else
        return "L"
      end
    end
    
    #-------------------------------------------
    #Recombine Street and Suffix
    def add_suffix(street,suf)
      return street +" "+suf
    end
    
    #--------------------------------------------
    def holiday?(date)
      holidays = ["January 01","January 17","February 21","May 30","July 04","September 05","October 10","November 11","November 24","November 25","December 25"]
      if holidays.find{|x| x == date.strftime("%B %d")}
        return TRUE
      end
      return FALSE
    end
        
    def is_same_day?(ct)
      if ct.bottomr == 0 
        return TRUE
      else 
        return FALSE
      end
    end
    
    def b4_ct?(ct,now)
      if now < ct.start
        return TRUE
      else
        return FALSE
      end
    end
    
    def during_ct?(ct,now)
      if (now > ct.start) and (now < ct.rl)
        return TRUE
      else
        return FALSE
      end
    end
    
    def after_ct?(ct,now)
      if now > ct.start
        return TRUE
      else
        return FALSE
      end
    end
    
    def add_n_weeks(ct,n)
      ct.streetname += n.weeks
      ct.topl += n.weeks
      return ct
    end
    
    def subtract_n_weeks(ct,n)
      ct.streetname -= n.weeks 
      ct.topl -= n.weeks
      return ct
    end
    
    def cleaned_on_holidays?(ct)
      return ct.holiday
    end
    
    def not_weekly?(ct)
      if ct.wk1 and ct.wk2 and ct.wk3 and ct.wk4 and ct.wk5
        return FALSE
      else 
        return TRUE
      end
    end    
      
  end
  