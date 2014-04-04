class RidesController < ApplicationController

def index

end

def new
end

def show
end

def dosearch

    params[:date] = params[:date] || {"from_Date" => cookies[:from_date], "to_Date" => cookies[:to_date]}

    cookies[:radio] = params[:search]["radio"] || "Oneway"

    cookies[:from] = cookies[:from] || params[:search]["from_city"]
    cookies[:to] = cookies[:to] || params[:search]["to_city"]

    cookies[:from_date] = params[:date]["from_Date"] || cookies[:from_date]  
    cookies[:to_date] = params[:date]["to_Date"] ||  cookies[:to_date] 
       
    params[:search] = params[:search] || {"radio" => cookies[:radio], "from_city" => cookies[:from], "to_city" => cookies[:to]}

    params[:date]["from_Date"] = params[:date]["from_Date"] || cookies[:from_date]
    params[:date]["to_Date"] = params[:date]["to_Date"] || cookies[:to_date]


    @perpage = @perpage || 5
    @perpage = params[:perpage] || @perpage

    @round_trip = false
    @rides = Ride.fetch_results(params[:search],params[:date])
    
    @rides = Kaminari.paginate_array(@rides).page(params[:page]).per(@perpage)
    if(params[:search]["radio"] == "RoundTrip")
      @round_trip = true
      @rides2 = Ride.fetch_back_results(params[:search],params[:date])
      #@rides2 = Kaminari.paginate_array(@rides2).page(params[:page]).per(@perpage)
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
