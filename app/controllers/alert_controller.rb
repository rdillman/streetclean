class AlertController < ApplicationController
  def create
    @user = current_user
    alert = make_alert(@user)
    @message = alert.create_message
    
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

  def cancel
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
      a = Alert.create
      a.set_alarm(@loc)
      return a
    else
      return nil
    end
    a
  end
end
