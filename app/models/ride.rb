class Ride < ActiveRecord::Base

attr_accessible :from_city


def self.fetch_results params

#	rides = Ride.where('id > 2')
# rides = Ride.where("from_city LIKE ?", "%#{params[:from_city]}%")
#	rides = Ride.all
#	rides = Ride.find(2)
  rides = Ride.find_by_sql("SELECT * FROM BusRideTest WHERE SOURCE_CITY = '#{params}'")
	return rides
end

end

