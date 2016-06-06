class Strip < ActiveRecord::Base
	has_many :projects, dependent: :destroy
end
