class CreateOfficepics < ActiveRecord::Migration
  def change
    create_table :officepics do |t|
       t.string :photo
       t.string :photo_category		
       t.timestamps null: false
    end
  end
end
