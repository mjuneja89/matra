class AddCoverCategoryToStrips < ActiveRecord::Migration
  def change
    add_column :strips, :cover_category, :string
  end
end
