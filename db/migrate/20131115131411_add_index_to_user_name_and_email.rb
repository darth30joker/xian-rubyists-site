class AddIndexToUserNameAndEmail < ActiveRecord::Migration
  def change
    add_index :users, :name
    add_index :users, :email
  end
end
