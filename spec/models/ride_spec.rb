require 'spec_helper'

describe Ride do

  describe 'results fetch' do
    it 'should do a sql call to search database' do
      fake_from = double('city1')
      fake_to = double('city2')
      fake_date = double('date1')
      fake_result = double('result1')
      fake_from.should_receive(:slice!)
      fake_to.should_receive(:slice!)
      fake_result.should_receive(:to_a).and_return(2)
      Ride.should_receive(:tablename).with(fake_date).and_return(1)
      Ride.should_receive(:find_by_sql).with("SELECT * from 1 WHERE DEPART_CITY like '%#{fake_from}%' AND ARRIVE_CITY like '%#{fake_to}%'").and_return(fake_result)
      results = Ride.fetch_results({:from_city => fake_from, :to_city => fake_to},{:from_Date => fake_date})
      results == 2
    end
    
    it 'should do a search for return trip' do
      fake_from = double('city3')
      fake_to = double('city4')
      fake_date = double('date1')
      fake_result = double('result1')
      fake_from.should_receive(:slice!)
      fake_to.should_receive(:slice!)
      fake_result.should_receive(:to_a).and_return(2)
      Ride.should_receive(:tablename).with(fake_date).and_return(1)
      Ride.should_receive(:find_by_sql).with("SELECT * from 1 WHERE DEPART_CITY like '%#{fake_to}%' AND ARRIVE_CITY like '%#{fake_from}%'").and_return(fake_result)
      results = Ride.fetch_back_results({:from_city => fake_from, :to_city => fake_to},{:to_Date => fake_date})
      results == 2
    end
  end

  describe 'convert date to tablename' do
    it 'should convert date string to match Table name in database' do
       #fake_date = double('date')
       #fake_day = double('day') 
       #fake_date.should_receive(:length)
       #fake_date.should_receive(:to_i).and_return('day')
       #fake_day.should_receive(:to_s)
       #fake_tablename = double('tablename')
       tname = Ride.tablename('Thu May 08 2014')
       tname.should == '2014May8'

    end
  end    

  describe 'sorting' do

    params = {:search => {:radio => "RoundTrip", :from_city => "New York, NY", :to_city => "Baltimore, MD"}, :date => {:from_Date => "Thu May 08 2014", :to_Date => "Thu May 08 2014"}}

    rides = Ride.fetch_results(params[:search], params[:date])

    x = rides[0]
    y = rides[1]

    x.TRIP_COST = 20
    y.TRIP_COST = 10

    x.DEPART_TIME = "2014-05-08 00:00:00 UTC"
    y.DEPART_TIME = "2014-05-08 12:00:00 UTC"

    x.COMPANY_NAME = "Alpha"
    y.COMPANY_NAME = "Zeta"
 
    rides = [x, y]

    it 'should sort by price' do
      rides = Ride.sortSearch(rides, "price")
      rides[0].TRIP_COST.should == 10
      rides[1].TRIP_COST.should == 20

      rides = Ride.sortSearch(rides, "priceRev")
      rides[0].TRIP_COST.should == 20
      rides[1].TRIP_COST.should == 10
    end

    it 'should sort by time' do
      rides = Ride.sortSearch(rides, "dTime")
      rides[0].DEPART_TIME.should == "2014-05-08 00:00:00 UTC"
      rides[1].DEPART_TIME.should == "2014-05-08 12:00:00 UTC"

      rides = Ride.sortSearch(rides, "dTimeRev")
      rides[0].DEPART_TIME.should == "2014-05-08 12:00:00 UTC"
      rides[1].DEPART_TIME.should == "2014-05-08 00:00:00 UTC"
    end

    it 'should sort by company name' do
      rides = Ride.sortSearch(rides, "company")
      rides[0].COMPANY_NAME.should == "Alpha"
      rides[1].COMPANY_NAME.should == "Zeta"

      rides = Ride.sortSearch(rides, "companyRev")
      rides[0].COMPANY_NAME.should == "Zeta"
      rides[1].COMPANY_NAME.should == "Alpha"
    end

  end


  describe 'android compatibility' do

    it 'should convert the table name to the correct format' do

      table = Ride.tabledroidname "1/1/2014"
      table.should == "2014January1"

      table = Ride.tabledroidname "2/1/2014"
      table.should == "2014February1"

      table = Ride.tabledroidname "3/1/2014"
      table.should == "2014March1"

      table = Ride.tabledroidname "4/1/2014"
      table.should == "2014April1"

      table = Ride.tabledroidname "5/1/2014"
      table.should == "2014May1"

      table = Ride.tabledroidname "6/1/2014"
      table.should == "2014June1"

      table = Ride.tabledroidname "7/1/2014"
      table.should == "2014July1"

      table = Ride.tabledroidname "8/1/2014"
      table.should == "2014August1"

      table = Ride.tabledroidname "9/1/2014"
      table.should == "2014September1"

      table = Ride.tabledroidname "10/1/2014"
      table.should == "2014October1"

      table = Ride.tabledroidname "11/1/2014"
      table.should == "2014November1"

      table = Ride.tabledroidname "12/1/2014"
      table.should == "2014December1"
      
    end

  end



end
