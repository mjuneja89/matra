class Portrait < ActiveRecord::Base
	belongs_to :project
    mount_uploader :photo, ImageUploader
end
