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

   def archives
   	@archives = Archive.order(created_at: :desc).page(params[:page]).per(4)
   end

   def show
      @archive = Archive.find(params[:id])
      respond_to :js
   end

   def edit
      @archive = Archive.find(params[:id])
   end

   def update
      @archive = Archive.find(params[:id])
      if @archive.update_attributes(archive_params)
         redirect_to adminview_path
      else
         render 'edit'
      end
   end

   def destroy
      @archive = Archive.find(params[:id])
      Archive.destroy(@archive)
      redirect_to 'adminview_path'
   end

   private

   def archive_params
   	 params.require(:archive).permit(:first_name, :last_name, :photo, :photo_category)
   end

end
