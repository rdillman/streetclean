# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

#User.delete_all
 #FasterCSV.foreach("db/user.csv") do |row|
 #User.create!(:encrypted_password => row[0], :created_at => row[1], :updated_at => row[2], :last_sign_in_ip => row[3],:username  => row[4], :last_sign_in_at  => row[5], :carrier => row[6],:sign_in_count => row[7],:phone_number => row[9],:reset_password_token => row[10],:current_sign_in_ip => nil, :remember_created_at => row[12],:current_sign_in_at => nil,:email => row[14])
 #puts(User.last)
#end

puts(Time.now)
Nhood.delete_all
FasterCSV.foreach("db/new_nhood.csv") do |row|
  Nhood.create!(:nhood => row[0])
end

Ct.delete_all
FasterCSV.foreach("db/new_ct.csv", :col_sep => " ") do |row|
  Ct.create!(:wday => row[0],:start => row[1],:stop => row[2], :boolyuns => row[3])
end

Street.delete_all
FasterCSV.foreach("db/new_street.csv") do |row|
  street = row.to_s
  street = street.split(' ')
  Street.create!(:suffix => street.pop, :streetname => street.join(' '))
end

Block.delete_all
c_offset = Ct.first.id-1
n_offset = Nhood.first.id-1
s_offset = Street.first.id-1
puts("starting blocks")
FasterCSV.foreach("db/new_block.csv") do |row|
  if row[0] == "R"
    Block.create!(:side => row[0], :bottom => row[4], :top => row[3], :dir => row[5], :ct_id => row[6].to_i+c_offset, :nhood_id => (row[7].to_i+n_offset), :street_id => (row[8].to_i+s_offset))
  elsif row[0] == "L"
    Block.create!(:side => row[0], :bottom => row[1], :top => row[2], :dir => row[5], :ct_id => row[6].to_i+c_offset, :nhood_id => (row[7].to_i+n_offset), :street_id => (row[8].to_i+s_offset))
  end
end

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

puts(Time.now)
puts("yay")


