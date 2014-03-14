class Ride < ActiveRecord::Base

attr_accessible :from_city , :to_city

def self.fetch_results params
	params[:from_city].slice! ", United States"
	params[:to_city].slice! ", United States"
	rides = Ride.find_by_sql("SELECT * from 2014March8 WHERE DEPART_CITY like '%#{params[:from_city]}%' AND ARRIVE_CITY like '%#{params[:to_city]}%'")
	return rides.to_a

end

def self.fetch_back_results params
	rides = Ride.find_by_sql("SELECT * from 2014March8 WHERE DEPART_CITY like '%#{params[:to_city]}%' AND ARRIVE_CITY like '%#{params[:from_city]}%'")
	return rides
end

end

