class Publication < ActiveRecord::Base
	mount_uploader :photo, NavphotoUploader
end
