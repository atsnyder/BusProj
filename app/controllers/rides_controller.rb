class RidesController < ApplicationController

def index
  @rides = Ride.all
  respond_to do |format|
    format.html
    format.xml  {render}
    format.json {render}
  end
end

def new
end

def show

    @rides = Ride.fetch_android_results(params[:search], params[:date])
    
    @rides = Kaminari.paginate_array(@rides).page(params[:page]).per(@perpage)
    if(params[:search]["radio"] == "OneWay" || params[:date]["to_Date"] == "")
      @round_trip = false
    else
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
#    if(@rides.size == 0)
#      flash[:notice] = "No routes found matching the search terms."
#      redirect_to rides_path
#    end
    
    @search = @rides
    respond_to do |format|
      format.html
      format.xml  {render}
      format.json {render}
    end

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



    params[:sort] = params[:sort] || "dTime"

    cookies[:sort] = params[:sort] || cookies[:sort]
    params[:sort] = params[:sort] || cookies[:sort]


    params[:perpage] = params[:perpage] || 10

    cookies[:perpage] = params[:perpage] || cookies[:perpage]
    params[:perpage] = params[:perpage] || cookies[:perpage]


    @round_trip = true
    @rides = Ride.fetch_results(params[:search],params[:date])
        
    @rides = Ride.sortSearch(@rides, cookies[:sort]) #call sortSearch method, pass sort type

    @rides = Kaminari.paginate_array(@rides).page(params[:page]).per(@perpage)




    if(params[:search]["radio"] == "OneWay" || params[:date]["to_Date"] == "")
      @round_trip = false
    else
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
      flash[:notice] = "No routes found matching the search terms."
      redirect_to rides_path
      return
    end
    
    @search = @rides
    respond_to do |format|
      format.html
      format.xml  {render}
      format.json {render}
    end
end


end
