class AddOrderIdToArchivestrips < ActiveRecord::Migration
  def change
    add_column :archivestrips, :order_id, :integer
  end
end
