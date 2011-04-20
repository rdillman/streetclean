desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
  if Time.now.min == 0 # run every hour
    Alert.send_all_alarms
  end
end