desc "This save the user, alerts, location,alarms and alarms tables. "
task :reopen_all_tables => :environment do
  
 #User.delete_all
  #FasterCSV.foreach("db/user.csv") do |row|
  #@user = User.create
  #@user.update_attributes(:encrypted_password => row[0], :created_at => row[1], :updated_at => row[2], :last_sign_in_ip => row[3],:username  => row[4], :last_sign_in_at  => row[5], :carrier => row[6],:sign_in_count => row[7],:phone_number => row[9],:reset_password_token => row[10],:current_sign_in_ip => nil, :remember_created_at => row[12],:current_sign_in_at => nil,:email => row[14])
  #puts(User.last)
 #end
  puts("sex")
  Alert.delete_all
  FasterCSV.foreach("db/alert.csv") do |row|
    Alert.create(:ct_id => row[0],:location=> row[1],:created_at=> row[2],:updated_at=> row[3],:clean_time=> row[4],:user_id=> row[6],:send_time=> row[7],:message=> row[8])
  end

  Location.delete_all
  FasterCSV.foreach("db/location.csv") do |row|
    Location.create(:created_at => row[0],:stop => row[1],:block_num => row[2],:updated_at => row[3],:streetname => row[4],:user_id => row[6],:start => row[7],:direction => row[8],:addr => row[9])
  end

  Feedback.delete_all
  FasterCSV.foreach("db/feedback.csv") do |row|
    Feedback.create(:created_at => row[0],:authorname => row[1],:updated_at => row[2],:authoremail => row[4],:authorcomments => row[5])
  end
  
end
