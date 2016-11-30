class ProjectsController < ApplicationController
  
   def new      
      @strip = Strip.find(params[:strip_id])
   	  @project = Project.new
      @square = @project.squares.build
      @landscape = @project.landscapes.build
      @portrait = @project.portraits.build
   end

   def create
      @strip = Strip.find(params[:strip_id])
   	  @project = Project.new(project_params) do |project|
         project.strip = @strip 
      end
   	if @project.save
        if params[:squares] 
         params[:squares]['photo'].each do |p|
            @image = Image.create!(:project_id => @project.id)
            @square = @project.squares.create!(:photo => p, :image_id => @image.id)
         end
        end
        if params[:landscapes]
         params[:landscapes]['photo'].each do |p|
            @image = Image.create!(:project_id => @project.id)
            @landscape = @project.landscapes.create!(:photo => p, :image_id => @image.id)
         end
        end
        if params[:portraits]         
         params[:portraits]['photo'].each do |p|
            @image = Image.create!(:project_id => @project.id)
            @portrait = @project.portraits.create!(:photo => p, :image_id => @image.id)
         end
        end
   	   redirect_to strip_project_selectcover_path(@project.strip, @project)  	
   	else
   	   render 'new' 	
   	end    	
   end

   def show
      @strip = Strip.find(params[:strip_id])
      @project = Project.find(params[:id])
      @images = @project.images.all.page(params[:page]).per(5)
   end

   def selectcover
      @strip = Strip.find(params[:strip_id])
      @project = Project.find(params[:project_id])
      @images = @project.images.all
   end
   
   def cover
      @strip = Strip.find(params[:strip_id])
      @project = Project.find(params[:project_id])
      @image = Image.find(params[:cover])
      @project.cover = @image
      redirect_to '/adminpanel'
   end

   private

   def project_params
   	params.require(:project).permit(:name, :description,squares_attributes: [:id, :project_id, :photo], landscapes_attributes: [:id, :project_id, :photo], portraits_attributes: [:id, :project_id, :photo])
   end 

end
