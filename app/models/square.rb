class Square < ActiveRecord::Base
   belongs_to :project
   belongs_to :image
   mount_uploader :photo, ImageUploader
end
