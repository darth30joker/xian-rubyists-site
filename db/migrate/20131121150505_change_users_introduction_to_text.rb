class ChangeUsersIntroductionToText < ActiveRecord::Migration
  def change
    change_column :users, :introduction, :text
  end
end
