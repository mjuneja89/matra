class TravelController < ApplicationController
	
	  def travels
	   @travels = Travel.all
	  end
    
    def new
      @travel = Travel.new
      @travel_photo = @travel.travel_photos.build
    end

    def create
       @travel = Travel.new(travel_params)

       respond_to do |format|
        if @travel.save
          params[:travel_photos]['picture'].each do |p|
          @travel_photo = @travel.travel_photos.create!(:picture => p)
        end
        format.html { redirect_to @travel }
        else
          format.html { render action: 'new' }
        end
      end 	
    
    end

    private

    def travel_params
    	params.require(:travel).permit(:name, travel_photos_attributes: [:id, :travel_id, :picture])
    end

end
