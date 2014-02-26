class CreateAccessTokens < ActiveRecord::Migration
  def change
    create_table :access_tokens do |t|
      t.integer :user_id
      t.string :nikename
      t.string :provider
      t.text :token
      t.string :secret

      t.timestamps
    end
  end
end
