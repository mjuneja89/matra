class AddImageIdToPortraits < ActiveRecord::Migration
  def change
    add_column :portraits, :image_id, :integer
  end
end
