class AddPhotoCategoryToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :photo_category, :string
  end
end
