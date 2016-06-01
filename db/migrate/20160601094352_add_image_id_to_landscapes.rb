class AddImageIdToLandscapes < ActiveRecord::Migration
  def change
    add_column :landscapes, :image_id, :integer
  end
end
