class AlertController < ApplicationController
  def create
    @user = current_user
    alert = make_alert(@user)
    if alert == -1
      @message = "An Alert Already Exists"
    else
      @message = alert.create_message
    end
    #Uncomment for Alert Testing
    #UserMailer.send_alert(alert).deliver    
    if @alert
      #It Worked!
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @message }
      end
    else
      #It FAILED
    end
  end

  def kill
    alarm_id = params[:q]
    to_delete = Alert.find(alarm_id)
    if current_user == to_delete.user
      to_delete.destroy
    else
      respond_to do |format|
        format      { render :file => "#{Rails.root}/public/no_street.html.erb" }
      end
    end
  end
  
  def show
    @user = current_user
    @alarms = @user.alert
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @alarms }
    end
    
  end

  private
  def make_alert(user)
    @user = current_user
    @loc = @user.location
    if @loc
      if alert_already_exists?(@loc)
        return -1
      else
        a = Alert.create
        a.set_alarm(@loc)
        return a
      end
    else
      return nil
    end
    a
  end
  
  def alert_already_exists?(loc)
    str = "the "<<loc.block_num.to_s<<" block of "<<loc.streetname<<" "<<loc.direction
    if (Alert.where("location =? AND user_id =? AND clean_time =?", str, loc.user_id,loc.start)==[])
      return false
    else
      return true
    end
  end
end
