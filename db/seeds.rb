# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
  # cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
  # Mayor.create(name: 'Emanuel', city: cities.first)
 #ride = Ride.where(fakerides : 'IowaCity').first_or_intialize
# ride.save!

#rides = [{:from_city => 'iowa city'},{:from_city => 'iowa city2'},{:from_city => 'iowa city3'}]

#rides.each do |ride|
#	Ride.create!(ride)
#end

  15.times do |i|
	Ride.create(from_city: "Chicago #{i}")
  end
