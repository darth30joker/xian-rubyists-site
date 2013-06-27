class AddValidateByAdminColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :validate_by_admin, :boolean, null: false, default: false
  end
end
