class TeamController < ApplicationController
  
  def team
  	@users = User.where.not(id: 1).order(:order_id).page(params[:page]).per(7)
  end
  
end
