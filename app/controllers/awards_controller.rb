class AwardsController < ApplicationController
   
   def new
   	@award = Award.new
   end

   def create
   	@award = Award.new(award_params)
   	if @award.save
   		redirect_to adminview_path
   	else
   		render 'new'
   	end
   end

   def awards
   	@awards = Award.order(created_at: :desc).page(params[:page]).per(4)
   end

   private

   def award_params
   	 params.require(:award).permit(:first_name, :last_name, :photo, :photo_category)
   end

end
