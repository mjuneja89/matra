class AddUserIdToStrips < ActiveRecord::Migration
  def change
    add_column :strips, :user_id, :integer
  end
end
