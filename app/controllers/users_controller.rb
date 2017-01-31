class UsersController < ApplicationController
	
  before_action :require_admin

	def new
		@user = User.new
	end
    
    def create
    	@user = User.new(user_params)
    	if @user.save
    		redirect_to user_avatar_path(@user)
    	else
    		render 'new'
    	end
    end

    def destroy
       @user = User.find(params[:id])
       User.delete(@user)
       redirect_to '/' 
    end

    def edit
       @user = User.find(params[:id])
    end

    def update
       @user = User.find(params[:id])
       if @user.update_attributes(user_params)
        redirect_to adminview_path
      else
        render 'edit'
      end
    end

    def avatar
       @user = User.find(params[:user_id])       
    end

    def updateavatar
      @user = User.find(params[:user_id])       
      if @user.update_attributes(user_params)
        @user.save(validate: false)
        redirect_to "/adminview"
      end  
    end

    private

    def user_params
       params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar, :avatar_category, :description)
    end

end
