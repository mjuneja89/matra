class Strip < ActiveRecord::Base
	has_many :projects, dependent: :destroy
	mount_uploader :cover, CoverUploader
end
