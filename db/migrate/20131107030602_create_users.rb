class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :nikename
      t.string :email
      t.date :birthday

      t.timestamps
    end
  end
end
