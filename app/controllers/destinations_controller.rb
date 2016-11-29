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
   	@destinations = Destination.order(created_at: :desc).page(params[:page]).per(4)
   end

   def show
      @destination = Destination.find(params[:id])
      respond_to :js
   end

   private

   def destination_params
   	 params.require(:destination).permit(:first_name, :last_name, :photo, :photo_category)
   end


end
