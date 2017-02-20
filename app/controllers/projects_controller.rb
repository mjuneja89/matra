class ProjectsController < ApplicationController

   before_action :require_admin, only: [:index, :new, :create, :edit, :update, :destroy]
   caches_page :show
   
   def index
    @strip = Strip.find(params[:strip_id])
    @projects = @strip.projects.order(:order_id)
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
      @images = @project.images.order(:order_id).page(params[:page]).per(7)
   end

   def edit
   	@strip = Strip.find(params[:strip_id])
      @project = Project.find(params[:id])
   end

   def editimages
      @strip = Strip.find(params[:strip_id])
      @project = Project.find(params[:project_id])
      @images = @project.images.order(:order_id)
      session[:project] = @project.id
   end

   def destroy
      @strip = Strip.find(params[:strip_id])
      @project = Project.find(params[:id])
      Project.destroy(@project)
      redirect_to "/adminview"
    end

   def update
   	@strip = Strip.find(params[:strip_id])
      @project = Project.find(params[:id])
      @image =  @project.images.find_by(id: @project.cover_id)
      if @project.update_attributes(project_params)
         @image.update_attribute(:priority_id, @project.order_id) 
      	redirect_to strip_projects_path(@strip)
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
   	params.require(:project).permit(:first_name, :last_name, :description, :yearcompleted, :location, :order_id)
   end 

end
