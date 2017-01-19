class DestinationsController < ApplicationController
   
   def new
   	@destination = Destination.new
   end

   def create
   	@destination = Destination.new(destination_params)
   	if @destination.save
   		redirect_to adminview_path
   	else
   		render 'new'
   	end
   end

   def travel
   	@destinations = Destination.order(created_at: :desc).page(params[:page]).per(8)
   end

   def show
      @destination = Destination.find(params[:id])
      respond_to :js
   end

   def edit
      @destination = Destination.find(params[:id])
   end

   def update
      @destination = Destination.find(params[:id])
      if @destination.update_attributes(destination_params)
         redirect_to adminview_path
      else
         render 'edit'
      end
   end


   def destroy
      @destination = Destination.find(params[:id])
      Destination.destroy(@destination)
      redirect_to 'adminview_path'
   end

   private

   def destination_params
   	 params.require(:destination).permit(:first_name, :last_name, :photo, :photo_category)
   end


end
