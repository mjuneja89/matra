class AddLastNameToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :last_name, :string
  end
end
