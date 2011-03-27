module StreetHelper
  def start_n_stop_times(res)
    all_times = "The next street clean for the "+res.bottomr.to_s+" block of "+res.streetname+" is on "
    all_times += Chronic.parse(res.day).strftime("%A, %B %d ")
    all_times += Chronic.parse(res.start).strftime("from %I:%M%p ")
    all_times += Chronic.parse(res.finish).strftime("to %I:%M%p.")
  end
  
end
