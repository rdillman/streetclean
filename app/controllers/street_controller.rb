class StreetController < ApplicationController
  
 #Most(if not all) Helper functions from this file live in app/controllers/application_controller.rb
  
  # User must sign in before using search function
  before_filter :authenticate_user!, :except => [:index]
  
  def index
    
  end

  def phone_carrier
    @user = current_user
    @user.email_to_text(params[:phone_carrier, :phone_number])    
  end
  
  def number
    @user = current_user
    @user.email_to_text(params[:phone_carrier, :phone_number])
  end
  
  def email
    @user = current_user
    UserMailer.send_next_time(@user).deliver
  end
  
  def text_message
    @user = current_user
    UserMailer.send_next_time(@user).deliver
  end
  

  def show
    #Format User Input from Search Bar:  101 Market St -> [101, Market, St]
    num, name = split_input(params[:q])
    
    #If record will not be found

    side = find_side(num)
    if (side == "R")
      @results = Street.where("streetname =? AND rl =? AND bottomr <=? AND topr >=?", name,side,num,num)
    elsif (side =="L")
      @results = Street.where("streetname =? AND rl =? AND bottoml <=? AND topl >=?", name,side,num,num)
    end
    #Get the next time
    @result, @warning  = get_next_time(@results)
    @user = current_user
    @loc = @user.location
    if !@loc
      @loc = Location.create(:user_id => @user.id)
      @loc.save
    end
    @loc.addr = num
    @loc.name = name
    new_start = @result.day.strftime("%A, %B %d from %I:%M%p")
    @loc.start = new_start
    new_stop = @result.finish
    @loc.stop = new_stop
    @loc.updated_at = Time.now
    @user.save!
    @loc.save!
    
    

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @result}
      format.xml  { render :xml => @warning }
    end
  end
end
