class AddLastNameToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :last_name, :string
  end
end
