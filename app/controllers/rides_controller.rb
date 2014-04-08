class RidesController < ApplicationController

def index

end

def new
end

def show
end

def dosearch

    params[:search] = params[:search] || {"radio" => cookies[:radio], "from_city" => cookies[:from], "to_city" => cookies[:to]}

    params[:date] = params[:date] || {"from_Date" => cookies[:from_date], "to_Date" => cookies[:to_date]}

    cookies[:radio] = params[:search]["radio"] || cookies[:radio]

    cookies[:from] = params[:search]["from_city"] || cookies[:from]
    cookies[:to] = params[:search]["to_city"] || cookies[:to]

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
    if(params[:search]["radio"] == "RoundTrip" || params[:date]["to_Date"] != "")
      @round_trip = true
      if(params[:search]["button_tag"].nil?)
        @button_tag = true
      else
        @button_tag = (!eval(params[:search]["button_tag"])) || false
      end
      @back_from = params[:search]["to_city"]
      @back_to = params[:search]["from_city"]
      @from_date = params[:date]["to_Date"]
      @to_date = params[:date]["from_Date"]
    end
    if(@rides.size == 0)
      flash[:notice] = "No routes found match the search terms."
      redirect_to rides_path
    end
end

end
