class AddYearcompletedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :yearcompleted, :string
  end
end
