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
            @square = @project.squares.create!(:photo => p)
         end
         params[:landscapes]['photo'].each do |p|
            @landscape = @project.landscapes.create!(:photo => p)
         end         
         params[:portraits]['photo'].each do |p|
            @portrait = @project.portraits.create!(:photo => p)
         end
   	   redirect_to '/'  	
   	else
   	   render 'new' 	
   	end    	
   end
   
   private

   def project_params
   	params.require(:project).permit(:name, :description, squares_attributes: [:id, :project_id, :photo], landscapes_attributes: [:id, :project_id, :photo], portraits_attributes: [:id, :project_id, :photo])
   end 

end
