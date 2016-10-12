class TravelPhoto < ActiveRecord::
   mount_uploader :picture, PictureUploader
   belongs_to :travel
end
