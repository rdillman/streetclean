class StreetController < ApplicationController
 #Most(if not all) Helper functions from this file live in app/controllers/application_controller.rb
  
  # User must sign in before using search function
  before_filter :authenticate_user!, :except => [:index]
  
  def index
  end

  def show
    
    #Format User Input from Search Bar:  101 Market St -> [101, Market, St]
    num, name = split_input(params[:q])

    #ERROR CHECKING  - for now, only checks for valid streetname
    @results = Oops.where("name = ?", name)
    
    #If record will not be found
    if (@results == [])
      #set warning flag and return search query
      @result = name
      @warning = -2
    else
      side = find_side(num)
      if (side == "R")
        @results = Street.where("streetname =? AND rl =? AND bottomr <=? AND topr >=?", name,side,num,num)
      elsif (side =="L")
        @results = Street.where("streetname =? AND rl =? AND bottoml <=? AND topl >=?", name,side,num,num)
      end
      #Get the next time
      @result, @warning  = get_next_time(@results)
    end
    

    


    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @result}
      format.xml  { render :xml => @warning }
    end
  end
  
  
  
  
  
  private

end
