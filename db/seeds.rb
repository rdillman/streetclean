# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Nhood.delete_all
open("db/new_nhood.csv") do |nhoods|
  nhoods.read.each_line do |nhood|
    nhood = nhood.chomp
    Nhood.create!(:nhood => nhood)
  end
end

Street.delete_all
open("db/new_street.csv") do |streets|
  streets.read.each_line do |street|
    streetname = street.chomp
    streetname = streetname.split(' ')
    suffix = streetname.pop
    name = streetname.pop
    Street.create!(:streetname => name, :suffix => suffix)
  end
end

Ct.delete_all
open("db/new_ct.csv") do |cts|
  cts.read.each_line do |ct|
    wday,start,stop,boolyuns = ct.chomp.split(' ')
    Ct.create!(:wday => wday,:start => start,:stop => stop, :boolyuns => boolyuns)
  end
end

Block.delete_all
open("db/new_block.csv") do |blocks|
  c_offset = Ct.first.id-1
  n_offset = Nhood.first.id-1
  s_offset = Street.first.id-1
  blocks.read.each_line do |block|
    side, lbottom, ltop, rtop, rbottom, dir, ct_ref, nhood_ref, street_ref = block.chomp.split(',')
    if side == "R"
      Block.create!(:side => side, :bottom => rbottom.to_i, :top => rtop.to_i, :dir => dir, :ct => Ct.find(ct_ref.to_i+c_offset), :nhood => Nhood.find(nhood_ref.to_i+n_offset), :street => Street.find(street_ref.to_i+s_offset))
    elsif side == "L"
      Block.create!(:side => side, :bottom => lbottom.to_i, :top => ltop.to_i, :dir => dir, :ct => Ct.find(ct_ref.to_i+c_offset), :nhood => Nhood.find(nhood_ref.to_i+n_offset), :street => Street.find(street_ref.to_i+s_offset))
    end
  end
end
