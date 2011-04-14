class StreetController < ApplicationController
  
 #Most(if not all) Helper functions from this file live in app/controllers/application_controller.rb
  
  # User must sign in before using search function
  before_filter :authenticate_user!, :except => [:index]
  
  def index
  end

  # def phone_carrier
  #   @user = current_user
  #   @user.email_to_text(params[:phone_carrier, :phone_number])    
  # end
  # 
  # def number
  #   @user = current_user
  #   @user.email_to_text(params[:phone_carrier, :phone_number])
  # end
  
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
    sid, @num = find_street(params[:q])
    @s = Street.find(sid)
    next_times,b_id = @s.next_clean_time(@num)
    @b = Block.find(b_id)
    #If record will not be found
    
    @user = current_user
    @loc = @user.location
    if !@loc
      @loc = Location.create(:user_id => @user.id)
      @loc.save
    end
    @loc.addr = @num
   # @loc.name = name
    @loc.start = next_times[0]
    @loc.stop = next_times[1]
    @loc.updated_at = Time.now
    @user.save!
    @loc.save!
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @loc }
      format.xml  { render :xml => @b }
      format.xml  { render :xml =>  @s }
      format.xml  { render :xml => @num }
    end
  end
  private
  
  def fuck
    return 0
  end
  
  
  def find_street(str)
    str.upcase!
    splt_str= str.split

    #Get address number and change it to integer
    num = splt_str[0]
    num = num.to_i
    

    # seperate the streetname and suffix from the rest of theinput
    # and join them all together
    len = splt_str.length
    name = splt_str.pop(len-1)
    name = name.join(" ")
    s = Street.where("streetname =?",name)
    if(s == [])
      name = pop_suff(name)
      s = Street.where("streetname =?",name)
      if(s == nil)
        #FUCK
      end
    end
    return s[0].id,num
  end

  def pop_suff(name)
    split = name.split
    split.pop
    split
  end
end
