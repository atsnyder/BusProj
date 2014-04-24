class Ride < ActiveRecord::Base

attr_accessible :from_city , :to_city 

@month = Hash["Jan","January",   "Feb","February",
		     "Mar" ,"March",    "Apr","April",
		     "May","May",       "Jun","June",
		     "Jul","July",      "Aug","August",
		     "Sep","September",	"Oct","October",
		     "Nov","November", 	"Dec","December"]

def self.fetch_results (params,paramsdate)
	params[:from_city].slice! ", United States"
	params[:to_city].slice! ", United States"
  puts params
  puts paramsdate
	table = tablename(paramsdate[:from_Date])         
	rides = Ride.find_by_sql("SELECT * from #{table} WHERE DEPART_CITY like '%#{params[:from_city]}%' AND ARRIVE_CITY like '%#{params[:to_city]}%'")
	return rides.to_a

end


def self.fetch_back_results (params,paramsdate)
	params[:from_city].slice! ", United States"
	params[:to_city].slice! ", United States"       
	table = tablename(paramsdate[:to_Date])         
	rides = Ride.find_by_sql("SELECT * from #{table} WHERE DEPART_CITY like '%#{params[:to_city]}%' AND ARRIVE_CITY like '%#{params[:from_city]}%'")
	return rides.to_a

end

def self.fetch_android_results (params,paramsdate)
	params[:from_city].slice! ", United States"
	params[:to_city].slice! ", United States"
  puts params
  puts paramsdate
	table = tabledroidname(paramsdate[:from_Date])         
	rides = Ride.find_by_sql("SELECT * from #{table} WHERE DEPART_CITY like '%#{params[:from_city]}%' AND ARRIVE_CITY like '%#{params[:to_city]}%'")
	return rides.to_a

end

def self.tabledroidname table
	  tempdate = table.split('/')
	  case tempdate[0]
	  when '1'
	    tempdate[0] = 'January'
	  when '2'
	    tempdate[0] = 'February'
	  when '3'
	    tempdate[0] = 'March'
	  when '4'
	    tempdate[0] = 'April'
	  when '5'
	    tempdate[0] = 'May'
	  when '6'
	    tempdate[0] = 'June'
	  when '7'
	    tempdate[0] = 'July'
	  when '8'
	    tempdate[0] = 'August'
	  when '9'
	    tempdate[0] = 'September'
	  when '10'
	    tempdate[0] = 'October'
	  when '11'
	    tempdate[0] = 'November'
	  when '12'
	    tempdate[0] = 'December'
	  else
	    tempdate[0] = "goofed"
	  end
	  tablename = (tempdate[2]+tempdate[0]+tempdate[1])
	  return tablename
end

def self.tablename table
	  year = table[(table.length)-4..table.length]	
	  day = ((table[(table.length-7)..(table.length-6)]).to_i).to_s
	  monthkey = table[4..(table.length-9)]	 
	  monthvalue = @month[monthkey]
	  tablename = (year+monthvalue+day)
	  puts(tablename)
	  return tablename
end

end

