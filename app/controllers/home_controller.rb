class HomeController < ApplicationController
	
 def home
    @strips = Strip.order(:order_id)
    @sums = Array.new
    @strips.each_with_index do |strip, i|
        j = 0
        if strip.category == "medium"       
          strip.projects.limit(4).each do |project|
              if project.images.find_by(:id => project.cover_id).photo_category == "landscape"
                  j = j + 13
              end
              if project.images.find_by(:id => project.cover_id).photo_category == "square"
                  j = j + 9
              end
              if project.images.find_by(:id => project.cover_id).photo_category == "portrait"
                  j = j + 8
              end
          end
        end
        if strip.category == "narrow"       
          strip.projects.limit(4).each do |project|
              if project.images.find_by(:id => project.cover_id).photo_category == "landscape"
                  j = j + 7
              end
              if project.images.find_by(:id => project.cover_id).photo_category == "square"
                  j = j + 2
              end
              if project.images.find_by(:id => project.cover_id).photo_category == "portrait"
                  j = j + 1
              end
          end
        end
        if strip.category == "broad"       
          strip.projects.limit(4).each do |project|
              if project.images.find_by(:id => project.cover_id).photo_category == "landscape"
                  j = j + 19
              end
              if project.images.find_by(:id => project.cover_id).photo_category == "square"
                  j = j + 15
              end
              if project.images.find_by(:id => project.cover_id).photo_category == "portrait"
                  j = j + 14
              end
          end
        end  
        @sums << j
    end
  end
    
end
