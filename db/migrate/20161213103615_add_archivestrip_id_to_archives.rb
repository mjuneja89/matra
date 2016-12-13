class AddArchivestripIdToArchives < ActiveRecord::Migration
  def change
    add_column :archives, :archivestrip_id, :integer
  end
end
