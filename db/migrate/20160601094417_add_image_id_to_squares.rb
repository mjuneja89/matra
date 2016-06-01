class AddImageIdToSquares < ActiveRecord::Migration
  def change
    add_column :squares, :image_id, :integer
  end
end
