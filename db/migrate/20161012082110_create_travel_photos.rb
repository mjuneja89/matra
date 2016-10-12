class CreateTravelPhotos < ActiveRecord::Migration
  def change
    create_table :travel_photos do |t|
      t.integer :travel_id
      t.string :picture
      t.timestamps null: false
    end
  end
end
