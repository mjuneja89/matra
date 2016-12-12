class AddCoverToStrips < ActiveRecord::Migration
  def change
    add_column :strips, :cover, :string
  end
end
