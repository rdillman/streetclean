desc "This save the user, alerts, location,alarms and alarms tables. "
task :save_all_tables => :environment do
  FasterCSV.open("db/alert.csv", "w") do |csv|
    Alert.all.each do |object|
      csv << object.attributes.values
    end
  end
  
  FasterCSV.open("db/user.csv", "w") do |csv|
    User.all.each do |object|
      csv << object.attributes.values
    end
  end
  
  FasterCSV.open("db/location.csv", "w") do |csv|
    Location.all.each do |object|
      csv << object.attributes.values
    end
  end
  
  FasterCSV.open("db/feedback.csv", "w") do |csv|
    Feedback.all.each do |object|
      csv << object.attributes.values
    end
  end
  
  FasterCSV.open("db/authentication.csv", "w") do |csv|
    Authentication.all.each do |object|
      csv << object.attributes.values
    end
  end
end