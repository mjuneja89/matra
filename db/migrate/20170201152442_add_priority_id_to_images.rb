class AddPriorityIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :priority_id, :integer
  end
end
