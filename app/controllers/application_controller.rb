class ApplicationController < ActionController::Base
  
  
  
  
  
  

  private #-------------------------------------------------------HElPER METHODS 
  
  # This function determines the next street cleaning time from an array of activeRecord database responses
  # --WARNING-- This function aint equipped to deal w/ holidays,every-other-week streets, or 
  # or same day requests...yet
    def get_next_time(results)
      
      now = Time.now
      #Create copy of records in order to manipulate the dates
      copy = results.clone
      
      #Turn the :day and :start attributes into Times then subtract the current time. The record with
      #the smallest value is the closest one in time. The id of the closest match is used to retrieve that
      #record in the original unmolested results, which is then returned
      copy.each{|x| x.day = Chronic.parse(x.day+" "+x.start)}
      copy.each{|x| x.day = x.day - now}
      best = copy.min_by{|x|x.day}
      return results.find{|x|x.id == best.id}
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
    
end
