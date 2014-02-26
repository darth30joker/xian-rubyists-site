class AddUidToAccessTokens < ActiveRecord::Migration
  def change
    add_column :access_tokens, :uid, :string, null: false
  end
end
