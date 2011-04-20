  # ActionMailer::Base.smtp_settings = {
  #   :address              => "smtp.gmail.com",
  #   :port                 => 587,
  #  :domain               => "gmail.com",
  #   :user_name            => "streetsweeper.sf",
  #   :password             => "fuckthep0l1c3",
  #   :authentication       => "plain",
  #   :enable_starttls_auto => true
  #}

 #For Local Host
 #ActionMailer::Base.default_url_options[:host] = "localhost:3000"


 ActionMailer::Base.smtp_settings = {
   :address        => "smtp.sendgrid.net",
   :port           => "25",
   :authentication => :plain,
   :user_name      => ENV['SENDGRID_USERNAME'],
   :password       => ENV['SENDGRID_PASSWORD'],
   :domain         => ENV['SENDGRID_DOMAIN']
 }
