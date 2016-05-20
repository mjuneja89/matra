class TeamController < ApplicationController
  
  def team
  	@users = User.all
  end
  
end
