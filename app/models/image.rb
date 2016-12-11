class Image < ActiveRecord::Base
	has_one :square
	has_one :landscape
	has_one :portrait
	belongs_to :project
    mount_uploader :photo, ImageUploader
end
