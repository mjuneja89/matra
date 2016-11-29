class Officepic < ActiveRecord::Base
	mount_uploader :photo, NavphotoUploader
end
