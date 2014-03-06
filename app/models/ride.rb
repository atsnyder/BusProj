class Ride < ActiveRecord::Base

attr_accessible :from_city

def self.fetch_results params
	rides = Ride.find_by_sql("SELECT * from BusTable WHERE SourceCity = '#{params}'")
	return rides
end


end

