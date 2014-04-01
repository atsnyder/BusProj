require 'spec_helper'

describe Ride do

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
