class Ride < ActiveRecord::Base

attr_accessible :from_city


def self.fetch_results params


#	rides = Ride.where("from_city LIKE ?", "%#{params[:from_city]}%")
#	rides = Ride.all
#	rides = Ride.find(2)
	rides = Ride.find_by_sql("SELECT * from 2014March7 WHERE DEPART_CITY like '%#{params}%'")#.page(params[:page]).per(5)

	return rides
end

end

