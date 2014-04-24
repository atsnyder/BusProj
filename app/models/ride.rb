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

def self.tablename table
	  year = table[(table.length)-4..table.length]	
	  day = ((table[(table.length-7)..(table.length-6)]).to_i).to_s
	  monthkey = table[4..(table.length-9)]	 
	  monthvalue = @month[monthkey]
	  tablename = (year+monthvalue+day)
	  return tablename
end

def self.sortSearch (rides, sort)

  if(sort.eql?("price"))
    rides = rides.sort_by{|x| [x.TRIP_COST]}
  end

  if(sort.eql?("priceRev"))
    rides = rides.sort_by{|x| [x.TRIP_COST]}
    rides.reverse!
  end

  if(sort.eql?("dTime"))
    rides = rides.sort_by{|x| [x.DEPART_TIME]}
  end

  if(sort.eql?("dTimeRev"))
    rides = rides.sort_by{|x| [x.DEPART_TIME]}
    rides.reverse!
  end

  if(sort.eql?("company"))
    rides = rides.sort_by{|x| [x.COMPANY_NAME]}
  end

  if(sort.eql?("companyRev"))
    rides = rides.sort_by{|x| [x.COMPANY_NAME]}
    rides.reverse!
  end

  return rides
end


end

