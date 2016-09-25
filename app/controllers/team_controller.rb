class TeamController < ApplicationController
  
  def team
  	@users = User.all.page(params[:page]).per(4)
  end
  
end
