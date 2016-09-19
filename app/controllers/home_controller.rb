class HomeController < ApplicationController
	
 def home
    @strips = Strip.all
    @sums = Array.new
    @strips.each_with_index do |strip, i|
        j = 0
        if strip.category == "medium"       
          strip.projects.limit(4).each do |project|
              if project.images.find_by(:id => project.cover_id).landscape.present?
                  j = j + 10
              end
              if project.images.find_by(:id => project.cover_id).square.present?
                  j = j + 7
              end
              if project.images.find_by(:id => project.cover_id).portrait.present?
                  j = j + 6
              end
          end
        end
        if strip.category == "narrow"       
          strip.projects.limit(4).each do |project|
              if project.images.find_by(:id => project.cover_id).landscape.present?
                  j = j + 5
              end
              if project.images.find_by(:id => project.cover_id).square.present?
                  j = j + 2
              end
              if project.images.find_by(:id => project.cover_id).portrait.present?
                  j = j + 1
              end
          end
        end
        if strip.category == "broad"       
          strip.projects.limit(4).each do |project|
              if project.images.find_by(:id => project.cover_id).landscape.present?
                  j = j + 15
              end
              if project.images.find_by(:id => project.cover_id).square.present?
                  j = j + 12
              end
              if project.images.find_by(:id => project.cover_id).portrait.present?
                  j = j + 11
              end
          end
        end  
        @sums << j
    end
  end
    
end
