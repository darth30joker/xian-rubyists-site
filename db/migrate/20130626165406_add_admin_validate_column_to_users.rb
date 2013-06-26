class AddAdminValidateColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin_validate, :boolean, null: false, default: false
  end
end
