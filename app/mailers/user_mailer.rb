class UserMailer < ActionMailer::Base
  default :from => "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_next_time.subject
  #
  def send_next_time(user)
    @user = user
    @loc = @user.location
    mail(:to => "#{user.username} <#{user.email}>", :subject => "Your next clean time")
  end

end
