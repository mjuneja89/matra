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
   	@officepics = Officepic.order(created_at: :desc).page(params[:page]).per(8)
   end

   def edit
      @officepic = Officepic.find(params[:id])
   end

   def update
      @officepic = Officepic.find(params[:id])
      if @officepic.update_attributes(officepic_params)
         redirect_to adminview_path
      else
         render 'edit'
      end
   end

   def destroy
      @officepic = Officepic.find(params[:id])
      Officepic.destroy(@officepic)
      redirect_to 'adminview_path'
   end

   private

   def officepic_params
   	 params.require(:officepic).permit(:photo, :photo_category)
   end


end
