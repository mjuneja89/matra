class AddCoverCategoryToArchivestrips < ActiveRecord::Migration
  def change
    add_column :archivestrips, :cover_category, :string
  end
end
