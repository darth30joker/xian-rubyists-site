# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  username               :string(255)      default(""), not null
#  provider               :string(255)
#  uid                    :string(255)
#  validate_by_admin      :boolean          default(FALSE), not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:github]

  validates_presence_of :username
  validates_uniqueness_of :username
  validates_length_of :username, within: 2..50

  def self.find_for_github_oauth(auth, signed_in_resource = nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first

    unless user
      user = User.create(provider: auth.provider, uid: auth.uid)
    end

    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.github_data']
        user.email = data['info']['email']
        user.provider = data['provider']
        user.uid = data['uid']
      end
    end
  end

end
