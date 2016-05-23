class CreateSquares < ActiveRecord::Migration
  def change
    create_table :squares do |t|
      t.string :photo
      t.integer :project_id 
      t.timestamps null: false
    end
  end
end
