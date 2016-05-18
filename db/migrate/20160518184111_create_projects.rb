class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.references :user, :strip, index: true, foreign_key: true
      t.timestamps null: false
    end
    add_index :projects, [:user_id, :strip_id]
  end
end
