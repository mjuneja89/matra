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

   private

   def award_params
   	 params.require(:publication).permit(:first_name, :last_name, :link, :photo, :photo_category)
   end

end
