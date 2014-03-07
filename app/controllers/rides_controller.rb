class RidesController < ApplicationController

def index
    @perpage = 5
end

def new
end

def show 

end


def dosearch    
     @rides = Ride.fetch_results params[:search]
     @rides = Kaminari.paginate_array(@rides).page(params[:page]).per(5)
     if(@rides.size == 0)
      flash[:notice] = "No routes match the search terms."
      redirect_to rides_path
    end
end

end
