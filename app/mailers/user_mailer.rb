class UserMailer < ActionMailer::Base
  default :from => "ticketcirtcket@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_next_time.subject
  # Sends text Message to user. Needs to be built into a function
  def send_next_time(user)
    @user = user
    @loc =  @user.location
    @pretty_string = @loc.html_pretty_string
    mail(:to =>"<#{user.text_address}>", :subject => "Your next clean time")
  end
  
  def send_alert(alert)
    user = alert.user
    @alarm_message = alert.alarm_message
    mail(:to =>"<#{user.text_address}>", :subject => "TicketCricket Alert!")
  end
end
