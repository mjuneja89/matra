class Project < ActiveRecord::Base
	belongs_to :strip
	has_many :squares
	has_many :portraits
	has_many :landscapes
	accepts_nested_attributes_for :squares	
	accepts_nested_attributes_for :portraits
	accepts_nested_attributes_for :landscapes
end
