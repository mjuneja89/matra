class Archive < ActiveRecord::Base
	belongs_to :archivestrip
	mount_uploader :photo, NavphotoUploader
end
