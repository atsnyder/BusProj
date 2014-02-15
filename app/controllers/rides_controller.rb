class RidesController < ApplicationController

def index
end

def new
end

def show 

end


def dosearch
    puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAAA" 
    puts params[:search][:To]    
    print "AAAAAAAAAAAAAAAAAAAAAAAAAAAAA"     
    @to_city =params[:search][:To]
end

end
