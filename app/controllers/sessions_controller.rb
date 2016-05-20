class SessionsController < ApplicationController
	def new
    end

    def create
    	@user = User.find_by_email(params[:session][:email])
    	if @user && @user.authenticate(params[:session][:password])
    		sign_in @user
            if @user.role == "admin"
    		  redirect_to "/adminview"
            else
              redirect_to "/"
            end    
    	else
    		flash.now[:danger] = "invalid email or password"
    	    render 'new'
    	end
    end

    def destroy
       sign_out(@user)
    end 

end
