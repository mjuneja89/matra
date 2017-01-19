class TeamController < ApplicationController
  
  def team
  	@users = User.order(:created_at).page(params[:page]).per(8)
  end
  
end
