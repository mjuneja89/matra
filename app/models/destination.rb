class Destination < ActiveRecord::Base
	mount_uploader :photo, NavphotoUploader
end
