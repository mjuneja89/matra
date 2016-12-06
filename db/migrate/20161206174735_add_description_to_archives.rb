class AddDescriptionToArchives < ActiveRecord::Migration
  def change
    add_column :archives, :description, :text
  end
end
