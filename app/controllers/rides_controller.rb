class RidesController < ApplicationController

def index
    @perpage = 5
end

def new
end

def show 

end


def dosearch    
     @rides = Ride.fetch_results params[:search][:from_city]
     puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
     puts @rides
end

end
