class AddOrderIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :order_id, :integer
  end
end
