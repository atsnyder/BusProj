class RidesController < ApplicationController

def index
end

def new
end

def dosearch
    radio = params[:search][:radio]
    search = params[:search][:title]
   
    redirect_to jobs_path
end

end
