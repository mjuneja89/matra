class TravelPhoto < ActiveRecord::
   mount_uploader :picture, PictureUploader
   belongs_to :picture
end
