class RidesController < ApplicationController

def index
    @perpage = 5
end

def new
end

def show
end

def dosearch
    @round_trip = false
    @rides = Ride.fetch_results params[:search]
    @rides = Kaminari.paginate_array(@rides).page(params[:page]).per(5)
    if(params[:search]["radio"] == "RoundTrip")
      @round_trip = true
      @rides2 = Ride.fetch_back_results params[:search]
      @rides2 = Kaminari.paginate_array(@rides2).page(params[:page]).per(5)
    end
    if(@rides.size == 0)
      flash[:notice] = "No routes found match the search terms."
      redirect_to rides_path
    elsif(@round_trip == true)
      if(@rides2.size == 0)
        flash[:notice] = "No routes found match the search terms."
        redirect_to rides_path
      else
        render :layout=>"frameset"
      end
    else
      render :layout=>"frameset"
    end
end

end
