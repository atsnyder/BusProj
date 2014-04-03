require 'spec_helper'

describe RidesController do

  describe 'searching' do
    it 'should save parameters in cookies' do

      post :dosearch, {:search => {:radio => "OneWay", :from_city => "New York, NY", :to_city => "Baltimore, MD"}, :date => {:from_Date => "Tue Apr 01 2014", :to_Date => "Tue Apr 01 2014"}}


      cookies[:to].should == "Baltimore, MD"
      cookies[:from].should == "New York, NY"
      cookies[:to_date].should == "Tue Apr 01 2014" 
      cookies[:from_date].should == "Tue Apr 01 2014"
      cookies[:radio].should == "OneWay"

      post :dosearch, {:search => {:radio => "RoundTrip", :from_city => "New York, NY", :to_city => "Baltimore, MD"}, :date => {:from_Date => "Tue Apr 01 2014", :to_Date => "Tue Apr 01 2014"}}
      
      cookies[:radio].should == "RoundTrip"


    end  

    it 'should redirect to the home page if there are no routes found' do

      post :dosearch, {:search => {:radio => "RoundTrip", :from_city => "Iowa City, IA", :to_city => "Coralville, IA"}, :date => {:from_Date => "Tue Apr 01 2014", :to_Date => "Tue Apr 01 2014"}}

      response.should redirect_to(rides_path)


    end


  end



end