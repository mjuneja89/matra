class Travel < ActiveRecord::Base
	has_many :travel_photos
	accepts_nested_attributes_for :travel_photos
end
