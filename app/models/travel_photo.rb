class TravelPhoto < ActiveRecord::Base
   mount_uploader :picture, PictureUploader	
   belongs_to :travel
end
