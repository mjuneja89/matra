class AddAvatarCategoryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar_category, :string
  end
end
