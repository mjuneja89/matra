class AddDescriptionToOfficepics < ActiveRecord::Migration
  def change
    add_column :officepics, :description, :text
  end
end
