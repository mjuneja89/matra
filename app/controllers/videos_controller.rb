class VideosController < ApplicationController
   
   def new
   	@video = Video.new
   end

   def create
   	@video = Video.new(video_params)
   	if @video.save
   		redirect_to adminview_path
   	else
   		render 'new'
   	end
   end
   
   def edit
      @video = Video.find(params[:id])
   end

   def update
      @video = Video.find(params[:id])
      if @video.update_attributes(video_params)
         redirect_to adminview_path
      else
         render 'edit'
      end
   end

   def destroy
      @video = Video.find(params[:id])
      Video.destroy(@video)
      redirect_to adminview_path
   end

   def videos
   	@videos = Video.order(created_at: :desc).page(params[:page]).per(7)
   end


   private

   def video_params
   	 params.require(:video).permit(:first_name, :last_name, :photo, :name, :photo_category)
   end


end
