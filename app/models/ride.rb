class Ride < ActiveRecord::Base

attr_accessible :from_city


def self.fetch_results params

#	rides = Ride.where('id > 2')
	rides = Ride.where("from_city LIKE ?", "%#{params[:from_city]}%").page(params[:page]).per(5)
#	rides = Ride.all
#	rides = Ride.find(2)
	return rides
end

end

