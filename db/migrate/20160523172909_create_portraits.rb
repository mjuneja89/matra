class CreatePortraits < ActiveRecord::Migration
  def change
    create_table :portraits do |t|
      t.string :photo
      t.integer :project_id
      t.timestamps null: false
    end
  end
end
