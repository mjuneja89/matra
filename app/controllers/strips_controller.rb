class StripsController < ApplicationController
	
    before_action :require_admin, only: [:index, :new, :create]
    
    def index
        @strips = Strip.all
    end

    def new
		@strip = Strip.new
	end
    
    def create
    	@strip = Strip.new(strip_params)
    	if @strip.save
    		redirect_to '/adminview'
    	else
    		render 'new'
    	end
    end

    def show
       @strip = Strip.find(params[:id])
    end 

    private

    def strip_params
    	params.require(:strip).permit(:name, :category)
    end

end
