class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :project_id
      t.string :photo

      t.timestamps null: false
    end
  end
end
