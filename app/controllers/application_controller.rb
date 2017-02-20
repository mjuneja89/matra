class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   include ActionController::Caching::Pages
     self.page_cache_directory = "#{Rails.root.to_s}/public/page_cache"
   include SessionsHelper

  helper_method :current_user
  
def current_user
  	current_user = User.find(session[:user_id]) if session[:user_id]
end

  def require_admin
  	redirect_to '/' unless current_user.role == "admin" 
  end

end
