class AwardsController < ApplicationController
   
   def new
   	@award = Award.new
   end

   def index
      @awards = Award.all
   end

   def create
   	@award = Award.new(award_params)
   	if @award.save
   		redirect_to adminview_path
   	else
   		render 'new'
   	end
   end

   def show
      @award = Award.find(params[:id])
      respond_to :js
   end
   
   def edit
      @award = Award.find(params[:id])
   end

   def update
      @award = Award.find(params[:id])
      if @award.update_attributes(award_params)
         redirect_to adminview_path
      else
         render 'edit'
      end
   end

   def destroy
      @award = Award.find(params[:id])
      Award.destroy(@award)
      redirect_to 'adminview_path'
   end

   def awards
   	@awards = Award.order(created_at: :desc).page(params[:page]).per(7)
   end


   private

   def award_params
   	 params.require(:award).permit(:first_name, :last_name, :link, :photo, :photo_category, :description)
   end

end
