class AddLinkToAwards < ActiveRecord::Migration
  def change
    add_column :awards, :link, :string
  end
end
