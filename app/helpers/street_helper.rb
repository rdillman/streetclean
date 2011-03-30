module StreetHelper
  
  # Makes one long ass string with the next cleaning time in it. 
  def start_n_stop_times(res, warn)
    block_num = 0
    next_clean_day = res.day
    next_clean_fin = Chronic.parse(res.finish)
    
    if res.bottomr == nil
      block_num = res.bottomr
    elsif
      block_num = res.bottoml-1
    end
    
    all_times = add_warning(warn)
  
    
    block_num = block_num.to_s
    all_times += "The next street clean for the "+block_num+" block of "+res.streetname+" is on "
    all_times += next_clean_day.strftime("%A, %B %d from %I:%M%p ")
    all_times += next_clean_fin.strftime("to %I:%M%p.")
  end
  
  def add_warning(warn)
    new_warning = ""
    if warn == -1
      new_warning = "WARNING - THIS STREET IS CURRENTLY BEING SWEPT! \n\n\n"
    elsif warn == 1
      new_warning = "WARNING - THIS STREET WILL BE CLEANED LATER TODAY!\n\n\n"
    end
    return new_warning
  end
  
end
