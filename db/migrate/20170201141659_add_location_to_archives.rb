class AddLocationToArchives < ActiveRecord::Migration
  def change
    add_column :archives, :location, :string
  end
end
