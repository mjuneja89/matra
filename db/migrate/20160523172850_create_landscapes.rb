class CreateLandscapes < ActiveRecord::Migration
  def change
    create_table :landscapes do |t|
      t.string :photo
      t.integer :project_id 
      t.timestamps null: false
    end
  end
end
