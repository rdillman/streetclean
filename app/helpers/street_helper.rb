module StreetHelper
  
  # Makes one long ass string with the next cleaning time in it. 
  def start_n_stop_times(loc, b, s , num)
    all_times = ""
    all_times += "The next street clean for the "+b.bottom.to_s
    all_times +=" block of "
    all_times <<s.streetname
    all_times<<" "
    all_times<<s.suffix
    all_times<<" "
    all_times<<b.dir
    all_times<<" is on "
    all_times << loc.start.strftime("%A, %B %d from %I:%M%p ")
    all_times << loc.stop.strftime("to %I:%M%p.")
  end
  
  def add_warning(loc)
    new_warning = ""
    
    #Add warning into the string 
    if loc.start.usec == 1
      new_warning = "WARNING - THIS STREET IS CURRENTLY BEING SWEPT! \n\n\n"
    end
    return new_warning
  end
  
end
