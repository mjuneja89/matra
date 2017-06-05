class AddPhotoToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :photo, :string
  end
end
