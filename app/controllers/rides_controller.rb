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

    params[:submit_btn] =  params[:submit_btn] || cookies[:submit_btn]

    cookies[:radio] = params[:search]["radio"] || cookies[:radio]

    cookies[:from] = params[:search]["from_city"] || cookies[:from]
    cookies[:to] = params[:search]["to_city"] || cookies[:to]

    cookies[:submit_btn] = params[:submit_btn]

    cookies[:from_date] = params[:date]["from_Date"] || cookies[:from_date]  
    cookies[:to_date] = params[:date]["to_Date"] ||  cookies[:to_date] 

    params[:search] = params[:search] || {"radio" => cookies[:radio], "from_city" => cookies[:from], "to_city" => cookies[:to]}

    params[:date]["from_Date"] = params[:date]["from_Date"] || cookies[:from_date]
    params[:date]["to_Date"] = params[:date]["to_Date"] || cookies[:to_date]
    params[:submit_btn] =  params[:submit_btn] || cookies[:submit_btn]

    if(params[:date]["to_Date"] == "")
      cookies[:radio] = "OnyWay"
    else
      cookies[:radio] = "RoundTrip"
    end

    @perpage = @perpage || 10
    @perpage = params[:perpage] || @perpage

    @round_trip = false
    @rides = Ride.fetch_results(params[:search],params[:date])
    
    @rides = Kaminari.paginate_array(@rides).page(params[:page]).per(@perpage)
    if(cookies[:radio] == "RoundTrip")
      @round_trip = true
      if(cookies[:submit_btn]=="go")
        @button_tag = true
      else
        @button_tag = false
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
