class ArchivesController < ApplicationController

   def new
      @archivestrip = Archivestrip.find(params[:archivestrip_id])
   	@archive = Archive.new
   end

   def create
      @archivestrip = Archivestrip.find(params[:archivestrip_id])
   	@archive = Archive.new(archive_params) do |archive|
         archive.archivestrip = @archivestrip
      end
   	if @archive.save
   		redirect_to adminview_path
   	else
   		render 'new'
   	end
   end

   def index
   	@archives = Archive.order(created_at: :desc).page(params[:page]).per(7)
   end

   def show
      @archivestrip = Archivestrip.find(params[:archivestrip_id])
      @archive = Archive.find(params[:id])
      respond_to :js
   end

   def edit
      @archivestrip = Archivestrip.find(params[:archivestrip_id])
      @archive = Archive.find(params[:id])
   end

   def update
      @archivestrip = Archivestrip.find(params[:archivestrip_id])
      @archive = Archive.find(params[:id])
      if @archive.update_attributes(archive_params)
         redirect_to adminview_path
      else
         render 'edit'
      end
   end

   def destroy
      @archivestrip = Archivestrip.find(params[:archivestrip_id])
      @archive = Archive.find(params[:id])
      Archive.destroy(@archive)
      redirect_to 'adminview_path'
   end

   private

   def archive_params
   	 params.require(:archive).permit(:first_name, :last_name, :photo, :photo_category)
   end

end
