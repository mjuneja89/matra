class TeamController < ApplicationController
  
  def team
  	@users = User.where.not(id: 1).order(:id).page(params[:page]).per(7)
  end
  
end
