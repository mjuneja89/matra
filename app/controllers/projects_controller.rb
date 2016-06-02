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
         params[:squares]['photo'].each do |p|
            @image = Image.create!(:project_id => @project.id)
            @square = @project.squares.create!(:photo => p, :image_id => @image.id)
         end
         params[:landscapes]['photo'].each do |p|
            @image = Image.create!(:project_id => @project.id)
            @landscape = @project.landscapes.create!(:photo => p, :image_id => @image.id)
         end         
         params[:portraits]['photo'].each do |p|
            @image = Image.create!(:project_id => @project.id)
            @portrait = @project.portraits.create!(:photo => p, :image_id => @image.id)
         end
   	   redirect_to '/'  	
   	else
   	   render 'new' 	
   	end    	
   end

   def show
      @strip = Strip.find(params[:strip_id])
      @project = Project.find(params[:id])
      @images = @project.images.all.page(params[:page]).per(3)
   end
      
   private

   def project_params
   	params.require(:project).permit(:name, :description, :cover, squares_attributes: [:id, :project_id, :photo], landscapes_attributes: [:id, :project_id, :photo], portraits_attributes: [:id, :project_id, :photo])
   end 

end
