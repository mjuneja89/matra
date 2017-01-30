class AddCoverToArchivestrips < ActiveRecord::Migration
  def change
    add_column :archivestrips, :cover, :string
  end
end
