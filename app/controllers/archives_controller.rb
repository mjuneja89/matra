class ArchivesController < ApplicationController

   def new
   	@archive = Archive.new
   end

   def create
   	@archive = Archive.new(archive_params)
   	if @archive.save
   		redirect_to adminview_path
   	else
   		render 'new'
   	end
   end

   def archive
   	@archives = Archive.order(created_at: :desc).page(params[:page]).per(4)
   end

   private

   def archive_params
   	 params.require(:archive).permit(:first_name, :last_name, :photo, :photo_category)
   end

end
