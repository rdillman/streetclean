# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Street.delete_all
open("db/streets.csv") do |streets|
  streets.read.each_line do |street|
   streetname,rl,bottoml,topl,bottomr, topr,day,start,finish, wk1, wk2,wk3,wk4,wk5,holiday = street.chomp.split(",")
  Street.create!(:streetname => streetname,:rl =>rl,:bottoml=>bottoml,:topl=>topl,:bottomr=>bottomr,:topr=>topr,:day=>day,:start=>start,:finish=>finish, :wk1=>wk1, :wk2=>wk2,:wk3=>wk3,:wk4=>wk4,:wk5=>wk5,:holiday=>holiday)
 end
end
