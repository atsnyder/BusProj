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
  if(@rides.size == 0)
    flash[:notice] = "No Result"
    redirect_to rides_path
  end
end

end
