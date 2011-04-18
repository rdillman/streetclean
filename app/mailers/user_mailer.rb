class UserMailer < ActionMailer::Base
  default :from => "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_next_time.subject
  # Sends text Message to user. Needs to be built into a function
  def send_next_time(user)
    @user = user
    @loc =  @user.location
    @pretty_string = @loc.pretty_string
    mail(:to =>"<#{user.text_address}>", :subject => "Your next clean time")
  end

end
