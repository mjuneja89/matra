class ProjectsController < ApplicationController
   
   def index
    @strip = Strip.find(params[:strip_id])
    @projects = @strip.projects.all
   end
   
   def new      
      @strip = Strip.find(params[:strip_id])
   	  @project = Project.new
   end

   def create
      @strip = Strip.find(params[:strip_id])
   	  @project = Project.new(project_params) do |project|
         project.strip = @strip 
      end
   	if @project.save
   	  session[:project] = @project.id	
      redirect_to new_image_path	
   	else
   	   render 'new' 	
   	end    	
   end

   def show
      @strip = Strip.find(params[:strip_id])
      @project = Project.find(params[:id])
      @images = @project.images.all.page(params[:page]).per(5)
   end

   def edit
   	  @strip = Strip.find(params[:strip_id])
      @project = Project.find(params[:id])
   end

   def update
   	  @strip = Strip.find(params[:strip_id])
      @project = Project.find(params[:id])
      if @project.update_attributes(project_params)
      	redirect_to adminview_path
      else
      	render 'edit'
      end
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
   	params.require(:project).permit(:first_name, :last_name, :description, :yearcompleted, :location)
   end 

end
