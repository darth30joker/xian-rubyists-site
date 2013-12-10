class ChangeUsersNikenameToFullname < ActiveRecord::Migration
  def change
    rename_column :users, :nikename, :fullname
  end
end
