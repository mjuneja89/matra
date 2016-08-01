class ImagesController < ApplicationController

  def show
  	@image = Image.find(params[:id])
  	respond_to :js
  end

  def cover
  	@image = Image.find(params[:image_id])
  	@project = @image.project
  	@strip = @project.strip
  	@project.cover_id = @image.id
    @project.save
  	redirect_to '/adminview'
  end

end
