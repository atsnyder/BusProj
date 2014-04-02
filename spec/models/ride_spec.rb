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
       tname = Ride.tablename('Tue Mar 08 2014')
       tname.should == '2014March8'

    end
  end    
end
