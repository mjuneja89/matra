class Removecolumn < ActiveRecord::Migration
  def change
  	remove_column :projects, :cover
  end
end
