class Award < ActiveRecord::Base
	mount_uploader :photo, NavphotoUploader
end
