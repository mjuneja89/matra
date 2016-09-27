class AddFirstNameToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :first_name, :string
  end
end
