class StreetController < ApplicationController
  
 #Most(if not all) Helper functions from this file live in app/controllers/application_controller.rb
  
  # User must sign in before using search function
  # Commenting out for testing!
  before_filter :authenticate_user!, :except => [:intro]
  
  def index
  end
  
  def mobile_home
    
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
    double_trouble = FALSE
    s, num = Street.find_street(params[:q])
    #If Street not Found
    if (s == -1)
      double_trouble = TRUE
      @usr_qry = params[:q]
      respond_to do |format|
        format.html { render :file => "#{Rails.root}/public/no_street.html.erb"}
        format.xml {render :xml => @usr_qry} 
      end
    end
    if (s != -1 && s.length >1)
      fuck,suff = Street.pop_suff(params[:q])
      if Street.valid_suffix?(suff)
        s = Street.where("streetname =? AND suffix = ?", s[0].streetname,suff)
      else
        @possible_streets = Array.new
        s.each do |x|
          tmp_str=num.to_s
          tmp_str<<" "
          tmp_str<<x.streetname
          tmp_str<<" "
          tmp_str<<x.suffix
          @possible_streets << tmp_str
        end
        double_trouble = TRUE
        respond_to do |format|
          format.html {render :file => "#{Rails.root}/public/too_many_streets.html.erb"}
          format.xml {render :xml => @possible_streets}
        end
      end
    end
    
    if(!double_trouble)
      sid = s[0].id
      s = Street.find(sid)
      next_times,b_id = s.next_clean_time(num)
      b = Block.find(b_id)


      @user = current_user
      @loc = @user.location
      if !@loc
        @loc = Location.create(:user_id => @user.id)
      end
      street_str = s.streetname<<" "<<s.suffix
      @loc.updateloc(num,b.bottom,street_str,b.dir,next_times[0].to_time,next_times[1].to_time)
      @pretty_str = @loc.pretty_string 

      respond_to do |format|
          format.html # show.html.erb
          format.xml  { render :xml => @pretty_str }
      end
    end
  
  end
  
  private
  
  def fuck
    return 0
  end
    

end
