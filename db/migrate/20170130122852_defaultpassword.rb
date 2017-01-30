class Defaultpassword < ActiveRecord::Migration
  def change
  	change_column :users, :password_digest, :string, :default => "MATRA2017"
  end
end
