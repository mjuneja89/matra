class User < ActiveRecord::Base
	has_secure_password
	validates :first_name, :presence => true
    has_many :strips, dependent: :destroy
	has_many :projects, dependent: :destroy
	mount_uploader :avatar, AvatarUploader	
end
