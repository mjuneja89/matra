class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.string :first_name
      t.string :last_name
      t.string :photo
      t.string :photo_category
      t.timestamps null: false
    end
  end
end
