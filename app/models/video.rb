class Video < ActiveRecord::Base
	mount_uploader :photo, NavphotoUploader
	mount_uploader :name, VideoUploader
end
