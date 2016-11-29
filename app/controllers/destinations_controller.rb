class DestinationsController < ApplicationController
   
   def new
   	@destination = destination.new
   end

   def create
   	@destination = destination.new(destination_params)
   	if @destination.save
   		redirect_to adminview_path
   	else
   		render 'new'
   	end
   end

   def travel
   	@destinations = destination.order(created_at: :desc).page(params[:page]).per(4)
   end

   def show
      @destination = destination.find(params[:id])
      respond_to :js
   end

   private

   def destination_params
   	 params.require(:destination).permit(:first_name, :last_name, :photo, :photo_category)
   end


end
