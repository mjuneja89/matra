class Addesc < ActiveRecord::Migration
  def change
  	add_column :awards, :description, :text
  	add_column :publications, :description, :text
  	add_column :destinations, :description, :text
  end
end
