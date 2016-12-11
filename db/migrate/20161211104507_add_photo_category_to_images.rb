class AddPhotoCategoryToImages < ActiveRecord::Migration
  def change
    add_column :images, :photo_category, :string
  end
end
