class AddIndexToAccessTokens < ActiveRecord::Migration
  def change
    add_index :access_tokens, :user_id
  end
end
