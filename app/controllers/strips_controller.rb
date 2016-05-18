class StripsController < ApplicationController
	def new
		@strip = Strip.new
	end
    
    def create
    	@strip = Strip.new(strip_params)
    	if @strip.save
    		redirect_to '/'
    	else
    		render 'new'
    	end
    end

    private

    def strip_params
    	params.require(:strip).permit(:name)
    end

end
