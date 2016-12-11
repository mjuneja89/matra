class ImagesController < ApplicationController
  
  def new
    @project = Project.find(session[:project])
    @image = Image.new   
  end

  def create
    @project = Project.find(session[:project])   
    @image = Image.new(image_params) do |image|
      image.project = @project
    end
    if @image.save
      redirect_to image_doyou_path(@image)
    else
      render 'new'
    end
  end

  def show
  	@image = Image.find(params[:id])
  	respond_to :js
  end

  def doyou
    @project = Project.find(session[:project])      
    @strip = @project.strip 
  end

  def cover
  	@image = Image.find(params[:image_id])
  	@project = @image.project
  	@strip = @project.strip
  	@project.cover_id = @image.id
    @project.save
  	redirect_to '/adminview'
  end

  private

  def image_params
    params.require(:image).permit(:photo, :photo_category)
  end

end
