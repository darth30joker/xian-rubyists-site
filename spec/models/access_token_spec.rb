# == Schema Information
#
# Table name: access_tokens
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  nikename   :string(255)
#  provider   :string(255)      not null
#  token      :text
#  secret     :string(255)
#  created_at :datetime
#  updated_at :datetime
#  uid        :string(255)      not null
#

require 'spec_helper'

describe AccessToken do

  it { should have_db_index :user_id }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :provider }
  it { should validate_presence_of :uid }

  pending 'should validate uniqueness of user_id scoped to provider' do
    it { should validate_uniqueness_of(:user_id).scoped_to(:provider) }
  end

  it { should belong_to :user }
end
