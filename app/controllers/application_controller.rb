class ApplicationController < ActionController::Base
  
  
  
  
  
  

  private #-------------------------------------------------------HELPER METHODS 
  
  # This function determines the next street cleaning time from an array of activeRecord database responses
  # --WARNING-- This function aint equipped to deal w/ holidays,every-other-week streets, or 
  # or same day requests...yet
    def get_next_time(ct)
        
      now = Time.now
      warning_flag = nil
      best = nil
            
      
      if not_weekly?(ct[0])
        ct, warning_flag =  get_non_weekly_best_time(ct[0],warning_flag,now)
        return ct, warning_flag
      end
      
      
      #Create copy of records in order to manipulate the dates---------------
      result_copy = create_copy(ct,now)
     
      #Same-day Test---------------------------------------------------------
      same = result_copy.find{|x| x.bottomr == 0}
      # if there is a day at the same time
      
      if same
        same, warning_flag = same_day_alterations(same,now,warning_flag)
      end
    
    # Compensate for Holidays 
      result_copy.each do |x|
        while holiday?(x.streetname) and cleaned_on_holidays?(x) == FALSE
          add_n_weeks(x,1)
        end
      end
      
      #-----Find the original ct that matched the best result
      best = result_copy.min_by{|x|x.topl}
      best_matching_result = ct.find{|x|x.id == best.id}
    
      
      #-----Change day value of best result to the actual street clean time 
      best_matching_result.day = best.streetname
      return best_matching_result, warning_flag
    end
    
    
    #-------Change if Same Day
    
    def same_day_alterations(same, now, warning_flag)
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
        warning_flag = 1
      end
      if during_ct?(same,now)
        warning_flag = -1
        add_n_weeks(same,1)
      end
      if after_ct?(same,now)
        add_n_weeks(same,1)
      end
      
      return same, warning_flag
    end
    
    
    
    def get_non_weekly_best_time(ct,warn,now)
      closest_times = nil
      day = ct.day
      best = 1.year
      months= Array.new
      start_times = Array.new
      stop_times = Array.new
     
      months << Chronic.parse("today")
      months << Chronic.parse("next month")
     
      
      start_times, stop_times = populate_start_stop_times(ct, start_times, stop_times, months)
      ct.day, warn = pick_smallest(start_times,stop_times,warn,now)
      return ct, warn            
    end
    
    def populate_start_stop_times(ct, start_times, finish_times, months)
      months.each do |y|
        this_month = y.strftime("%B")
        day = ct.day
        if ct.wk1?
          target_date = Chronic.parse("1st "+day+" in "+this_month)
          start_times,finish_times = fill_week_times(ct,target_date,start_times,finish_times)
        end
        if ct.wk2?
          target_date = Chronic.parse("2nd "+day+" in "+this_month)
          start_times,finish_times = fill_week_times(ct,target_date,start_times,finish_times)       
        end
        if ct.wk3?
          target_date = Chronic.parse("3rd "+day+" in "+this_month)
          start_times,finish_times = fill_week_times(ct,target_date,start_times,finish_times) 
        end
        if ct.wk4?
          target_date = Chronic.parse("4th "+day+" in "+this_month)
          start_times,finish_times = fill_week_times(ct,target_date,start_times,finish_times)
        end
        if ct.wk5?
          target_date = Chronic.parse("5th "+day+" in "+this_month)
          start_times,finish_times = fill_week_times(ct,target_date,start_times,finish_times)
        end
      end
      return start_times, finish_times
    end
    
    
    def pick_smallest(start, stop, warn, now)
      best = 1.year
      top_pick = nil
      
      
      stop.each do |x|
        
        curr_start = stop.find_index(x)
        time_diff = x-now
        if time_diff > 0 and time_diff < best
          
          if start[curr_start] < now
            
            current_warning = -1
            x = x+2.month
          else
            best = time_diff
            top_pick = curr_start
          end
        end
      end
      return start[top_pick], warn
    end
    
          
        
    
    def fill_week_times(ct,target_date,start_times,finish_times)
      if holiday?(target_date)== false
          target_date_str = target_date.strftime("%D")
          start_times << Chronic.parse(target_date_str+" "+ct.start)
          finish_times << Chronic.parse(target_date_str+" "+ct.finish)
      elsif
        if cleaned_on_holidays?(target_date)
          target_date_str = target_date.strftime("%D")
          start_times << Chronic.parse(target_date_str+" "+ct.start)
          finish_times << Chronic.parse(target_date_str+" "+ct.finish)
        end
      end
      return start_times,finish_times
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
      splt_str= str.split
      num = splt_str[0]
      num = num.to_i
      len = splt_str.length
      name = splt_str.pop(len-1)
      name = name.join(" ")
      return num, name
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
      debugger
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
