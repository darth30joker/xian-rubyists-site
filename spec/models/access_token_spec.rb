# == Schema Information
#
# Table name: access_tokens
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  nikename   :string(255)
#  provider   :string(255)
#  token      :text
#  secret     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe AccessToken do

  it { should belong_to :user }
end
