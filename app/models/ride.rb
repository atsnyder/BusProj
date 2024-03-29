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
	table = tablename(paramsdate[:from_Date])

  table_exist = Ride.find_by_sql("SHOW TABLES like '#{table}'")

  if table_exist.length == 0
      return []
  else
       	rides = Ride.find_by_sql("SELECT * from #{table} WHERE DEPART_CITY like '%#{params[:from_city]}%' AND ARRIVE_CITY like '%#{params[:to_city]}%' AND TRIP_COST IS NOT NULL")
      	return rides.to_a
  end

end


#def self.fetch_back_results (params,paramsdate)
#	params[:from_city].slice! ", United States"
#	params[:to_city].slice! ", United States"       
#	table = tablename(paramsdate[:to_Date])         
#	rides = Ride.find_by_sql("SELECT * from #{table} WHERE DEPART_CITY like '%#{params[:to_city]}%' AND ARRIVE_CITY like '%#{params[:from_city]}%'")
#	return rides.to_a
#end

def self.fetch_android_results (params,paramsdate)
	params[:from_city].slice! ", United States"
	params[:to_city].slice! ", United States"
	table = tabledroidname(paramsdate[:from_Date])         
	rides = Ride.find_by_sql("SELECT * from #{table} WHERE DEPART_CITY like '%#{params[:from_city]}%' AND ARRIVE_CITY like '%#{params[:to_city]}%' AND TRIP_COST IS NOT NULL")
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

