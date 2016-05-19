class AdminController < ApplicationController
  
  before_action :require_admin

  def adminview
  end

end
