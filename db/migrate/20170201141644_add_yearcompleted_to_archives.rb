class AddYearcompletedToArchives < ActiveRecord::Migration
  def change
    add_column :archives, :yearcompleted, :string
  end
end
