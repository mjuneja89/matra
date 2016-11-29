class OfficepicsController < ApplicationController
    
   def new
   	@officepic = Officepic.new
   end

   def create
   	@officepic = Officepic.new(officepic_params)
   	if @officepic.save
   		redirect_to adminview_path
   	else
   		render 'new'
   	end
   end

   def contact
   	@officepics = Officepic.order(created_at: :desc).page(params[:page]).per(4)
   end

   private

   def officepic_params
   	 params.require(:officepic).permit(:photo, :photo_category)
   end


end
