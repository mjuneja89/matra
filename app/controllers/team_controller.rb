class TeamController < ApplicationController
  
  def team
  	@users = User.order(:id).page(params[:page]).per(7)
  end
  
end
