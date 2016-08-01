class AddCoverIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :cover_id, :integer
  end
end
