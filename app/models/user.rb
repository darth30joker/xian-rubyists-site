# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  fullname        :string(255)
#  email           :string(255)
#  birthday        :date
#  created_at      :datetime
#  updated_at      :datetime
#  introduction    :string(255)
#  password_digest :string(255)
#

class User < ActiveRecord::Base

  has_secure_password

  def age

  end
end
