class RidesController < ApplicationController

def index
end

def new
end

def show 

end


def dosearch    
     scity = params[:search][:from_city]	
     @rides = Ride.fetch_results scity
     puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
     puts @rides
end

end
