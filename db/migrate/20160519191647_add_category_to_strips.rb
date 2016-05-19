class AddCategoryToStrips < ActiveRecord::Migration
  def change
    add_column :strips, :category, :string
  end
end
