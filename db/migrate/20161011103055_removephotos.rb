class Removephotos < ActiveRecord::Migration
  def change
  	drop_table :travel_photos
  end
end
