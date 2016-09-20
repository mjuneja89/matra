class HomeController < ApplicationController
	
 def home
    @strips = Strip.all
    @sums = Array.new
    @strips.each_with_index do |strip, i|
        j = 0
        if strip.category == "medium"       
          strip.projects.limit(4).each do |project|
              if project.images.find_by(:id => project.cover_id).landscape.present?
                  j = j + 13
              end
              if project.images.find_by(:id => project.cover_id).square.present?
                  j = j + 9
              end
              if project.images.find_by(:id => project.cover_id).portrait.present?
                  j = j + 8
              end
          end
        end
        if strip.category == "narrow"       
          strip.projects.limit(4).each do |project|
              if project.images.find_by(:id => project.cover_id).landscape.present?
                  j = j + 7
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
                  j = j + 19
              end
              if project.images.find_by(:id => project.cover_id).square.present?
                  j = j + 15
              end
              if project.images.find_by(:id => project.cover_id).portrait.present?
                  j = j + 14
              end
          end
        end  
        @sums << j
    end
  end
    
end
