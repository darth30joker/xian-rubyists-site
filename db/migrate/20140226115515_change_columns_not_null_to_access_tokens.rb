class ChangeColumnsNotNullToAccessTokens < ActiveRecord::Migration
  def change
    change_column_null :access_tokens, :user_id, false
    change_column_null :access_tokens, :provider, false
  end
end
