class User < ActiveRecord::Base
	validates :first_name, :presence => true
    has_many :strips, dependent: :destroy
	has_many :projects, dependent: :destroy
	mount_uploader :avatar, AvatarUploader	
end
