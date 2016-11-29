class Archive < ActiveRecord::Base
	mount_uploader :photo, NavphotoUploader
end
