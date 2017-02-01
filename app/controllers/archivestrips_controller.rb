class ArchivestripsController < ApplicationController
   
    before_action :require_admin, only: [:index, :new, :create, :edit, :update, :destroy]
    
    def index
        @archivestrips = Archivestrip.order(:order_id)
    end

    def archives
    	@archivestrips = Archivestrip.all
        @sums = Array.new
        @archivestrips.each_with_index do |strip, i|
          j = 0
          if strip.category == "medium"       
           strip.archives.limit(4).each do |archive|
              if archive.photo_category == "landscape"
                  j = j + 13
              end
              if archive.photo_category == "square"
                  j = j + 9
              end
              if archive.photo_category == "portrait"
                  j = j + 8
              end
            end
          end
          if strip.category == "narrow"       
           strip.archives.limit(4).each do |archive|
              if archive.photo_category == "landscape"
                  j = j + 7
              end
              if archive.photo_category == "square"
                  j = j + 2
              end
              if archive.photo_category == "portrait"
                  j = j + 1
              end
            end
          end
          if strip.category == "broad"       
            strip.archives.limit(4).each do |archive|
              if archive.photo_category == "landscape"
                  j = j + 19
              end
              if archive.photo_category == "square"
                  j = j + 15
              end
              if archive.photo_category == "portrait"
                  j = j + 14
              end
            end
          end  
          @sums << j
       end
    end

    def new
		@archivestrip = Archivestrip.new
	end
    
    def create
    	@archivestrip = Archivestrip.new(archivestrip_params)
    	if @archivestrip.save
    		redirect_to '/adminview'
    	else
    		render 'new'
    	end
    end

    def show
       @archivestrip = Archivestrip.find(params[:id])
       @archives = @archivestrip.archives.order(:id).page(params[:page]).per(7)
    end 

    def edit
       @archivestrip = Archivestrip.find(params[:id]) 
    end

    def update
        @archivestrip = Archivestrip.find(params[:id])
        if @archivestrip.update_attributes(archivestrip_params)
        	redirect_to adminview_path
        else
            render 'edit' 
        end
    end

    def destroy
    	@archivestrip = Archivestrip.find(params[:id])
        Archivestrip.destroy(@strip)
        redirect_to "/adminview"
    end

    private

    def archivestrip_params
    	params.require(:archivestrip).permit(:name, :category, :cover, :cover_category, :order_id)
    end


end
