class CreateTravelPhotos < ActiveRecord::Migration
  def change
    create_table :travel_photos do |t|
      t.string :picture
      t.integer :travel_id
      t.timestamps null: false
    end
  end
end
