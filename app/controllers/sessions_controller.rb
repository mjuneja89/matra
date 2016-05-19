class SessionsController < ApplicationController
	def new
    end

    def create
    	@user = User.find_by_email(params[:session][:email])
    	if @user && @user.authenticate(params[:session][:password])
    		sign_in @user
    		redirect_to "/"
    	else
    		flash.now[:danger] = "invalid email or password"
    	    render 'new'
    	end
    end

    def destroy
       sign_out(@user)
    end 

end
