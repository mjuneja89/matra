class SearchesController < ApplicationController
   
   def search
   	if params[:search] 
      project_ids = []
      award_ids = []
      publication_ids = []
      project_ids << Project.where('first_name ILIKE ?', "%#{params[:search]}%").all.map(&:id)
      project_ids << Project.where('last_name ILIKE ?', "%#{params[:search]}%").all.map(&:id) 
      project_ids << Project.where('location ILIKE ?', "%#{params[:search]}%").all.map(&:id)
      project_ids << Project.where('yearcompleted ILIKE ?', "%#{params[:search]}%").all.map(&:id)
      @projects = Project.where(id: project_ids)
      award_ids << Award.where('first_name ILIKE ?', "%#{params[:search]}%").all.map(&:id) 
      award_ids << Award.where('last_name ILIKE ?', "%#{params[:search]}%").all.map(&:id) 
      @awards = Award.where(id: award_ids)
      publication_ids << Publication.where('first_name ILIKE ?', "%#{params[:search]}%").all.map(&:id) 
      publication_ids << Publication.where('last_name ILIKE ?', "%#{params[:search]}%").all.map(&:id) 
      @publications = Publication.where(id: publication_ids)
    end
   end

end
