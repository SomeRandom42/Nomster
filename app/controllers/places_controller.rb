class PlacesController < ApplicationController
   before_action :authenticate_user!, only: [:new, :create] 
   
    def index
        
        @places = Place.all
        @places = Place.paginate(:page => params[:page], :per_page => 10)
        @places_last = Place.last
    end
    
    def new 
        @place = Place.new
    end    
    
    def create
        current_user.places.create(place_params)
        redirect_to root_path
    end
    
    def show
        @place = Place.find(params[:id])
    end    
    
    private
    
    def place_params
        params.require(:place).permit(:name, :description, :address) 
    end    
    
    
    
    
    
    
    
    
end

    def self.search(place, current_page)
        if term
            page(current_page).where('name LIKE ?', "%#{term}%").order('id DESC')
        else
            page(current_page).order('id DESC') 
        end
    end
