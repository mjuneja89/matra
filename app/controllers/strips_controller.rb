class StripsController < ApplicationController
	
    before_action :require_admin, only: [:index, :new, :create, :edit, :update, :destroy]
    
    def index
        @strips = Strip.order(:order_id)
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
       @projects = @strip.projects.order(:order_id)
       image_ids = []
       @strip.projects.each do |project|
        image_ids << project.images.find_by(:id => project.cover_id).id
       end
       @images = Image.where(id: image_ids).order(:priority_id).page(params[:page]).per(7)
    end 

    def edit
       @strip = Strip.find(params[:id]) 
    end

    def update
        @strip = Strip.find(params[:id])
        if @strip.update_attributes(strip_params)
        	redirect_to adminview_path
        else
            render 'edit' 
        end
    end

    def editpriority
        @strip = Strip.find(params[:strip_id])
    end

    def updatepriority
        @strip = Strip.find(params[:strip_id])
        if @strip.update_attributes(strip_params)
            redirect_to adminview_path
        end 
    end

    def destroy
    	@strip = Strip.find(params[:id])
        Strip.destroy(@strip)
        redirect_to "/adminview"
    end

    private

    def strip_params
    	params.require(:strip).permit(:name, :category, :cover, :cover_category, :order_id)
    end

end
