class AddOrderIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :order_id, :integer
  end
end
