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

class AccessToken < ActiveRecord::Base

  belongs_to :user

  validates :user_id, :provider, :uid, presence: true

  validates :user_id, uniqueness: { scope: :provider }
end
