class AddOrderIdToStrips < ActiveRecord::Migration
  def change
    add_column :strips, :order_id, :integer
  end
end
