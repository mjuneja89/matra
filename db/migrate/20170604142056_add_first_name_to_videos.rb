class AddFirstNameToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :first_name, :string
  end
end
