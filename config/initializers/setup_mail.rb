ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "railscast.com",
  :user_name            => "railscast",
  :password             => "secret",
  :authentication       => "plain",
  :enable_starttls_auto => true
}