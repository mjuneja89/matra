class PublicationsController < ApplicationController
   
   def new
   	@publication = Publication.new
   end

   def create
   	@publication = Publication.new(publication_params)
   	if @publication.save
   		redirect_to adminview_path
   	else
   		render 'new'
   	end
   end

   def publications
   	@publications = Publication.order(created_at: :desc).page(params[:page]).per(4)
   end

   def show
      @publication = Publication.find(params[:id])
      respond_to :js
   end

   def edit
      @publication = Publication.find(params[:id])
   end

   def update
      @publication = Publication.find(params[:id])
      if @publication.update_attributes(publication_params)
         redirect_to adminview_path
      else
         render 'edit'
      end
   end

   def destroy
      @publication = Publication.find(params[:id])
      Publication.destroy(@publication)
      redirect_to 'adminview_path'
   end

   private

   def publication_params
   	 params.require(:publication).permit(:first_name, :last_name, :link, :photo, :photo_category)
   end

end
