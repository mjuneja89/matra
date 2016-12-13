class Archivestrip < ActiveRecord::Base
	has_many :archives, dependent: :destroy
end
