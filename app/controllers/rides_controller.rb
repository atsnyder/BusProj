class RidesController < ApplicationController

def index
end

def new
end

def show 

end


def dosearch    
     @rides = Ride.fetch_results params[:search]
     puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
     puts @rides
end

end
