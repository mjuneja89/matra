class User < ActiveRecord::Base
	has_secure_password
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, :presence => true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
	validates :password, :presence => true, length: {minimum: 6}, allow_nil: true
	validates :first_name, :presence => true
    has_many :strips, dependent: :destroy
	has_many :projects, dependent: :destroy
	mount_uploader :avatar, AvatarUploader	
end
