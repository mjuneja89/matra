class ImagesController < ApplicationController

  def show
  	@image = Image.find(params[:id])
  	respond_to :js
  end

end
