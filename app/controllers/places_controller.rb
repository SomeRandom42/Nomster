class PlacesController < ApplicationController
    def index
        
        @places = Place.all
        @places = Place.paginate(:page => params[:page], :per_page => 10)
        @places_last = Place.last
    end
    
    def new 
        @place = Place.new
    end    
    
    
end

    def self.search(place, current_page)
        if term
            page(current_page).where('name LIKE ?', "%#{term}%").order('id DESC')
        else
            page(current_page).order('id DESC') 
        end
    end
