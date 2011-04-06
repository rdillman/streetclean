module StreetHelper
  
  # Makes one long ass string with the next cleaning time in it. 
  def start_n_stop_times(res, warn)
    
    #If invalid streetname
    if(warn == -2)
      return  "Sorry we don't have any street sweeping records for "+ res+". Please ensure that you spelled the streetname correctly."
    end
    
    #Get the Block, start and stop time
    block_num = 0
    next_clean_day = res.day
    next_clean_fin = Chronic.parse(res.finish)
    if res.bottomr != nil
      block_num = res.bottomr
    else
      block_num = res.bottoml-1
    end
    
    #Make a beautiful string with block #, start and sstop times
    all_times = add_warning(warn)  
    block_num = block_num.to_s
    all_times += "The next street clean for the "+block_num+" block of "+res.streetname+" is on "
    all_times += next_clean_day.strftime("%A, %B %d from %I:%M%p ")
    all_times += next_clean_fin.strftime("to %I:%M%p.")
  end
  
  def add_warning(warn)
    new_warning = ""
    
    #Add warning into the string 
    if warn == -1
      new_warning = "WARNING - THIS STREET IS CURRENTLY BEING SWEPT! \n\n\n"
    elsif warn == 1
      new_warning = "WARNING - THIS STREET WILL BE CLEANED LATER TODAY!\n\n\n"
    end
    return new_warning
  end
  
end
