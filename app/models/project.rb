class Project < ActiveRecord::Base
	belongs_to :strip
	has_many :images, dependent: :destroy
	has_many :squares, dependent: :destroy
	has_many :portraits, dependent: :destroy
	has_many :landscapes, dependent: :destroy	
	has_one :cover, :class_name => "Image"
	accepts_nested_attributes_for :squares	
	accepts_nested_attributes_for :portraits
	accepts_nested_attributes_for :landscapes
end
