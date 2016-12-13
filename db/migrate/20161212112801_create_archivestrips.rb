class CreateArchivestrips < ActiveRecord::Migration
  def change
    create_table :archivestrips do |t|
      t.string :name
      t.string :category
      t.timestamps null: false
    end
  end
end
