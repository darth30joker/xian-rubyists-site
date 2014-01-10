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
#  introduction    :text
#  password_digest :string(255)
#  remember_token  :string(255)
#

class User < ActiveRecord::Base
  before_create :create_remember_token
  before_save :make_attributes_downcase

  validate :birthday_cannot_be_later_than_today

  # From GitHub's username regex
  VALID_NAME_REGEX = /\A([a-z0-9_\-])+\z/ix
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false },
                   length: { maximum: 25 },
                   format: { with: VALID_NAME_REGEX }

  validates :fullname, presence: true,
                       length: { maximum: 50 }

  # This regex is from http://ruby.railstutorial.org/chapters/modeling-users#code-better_email_regex
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }

  validates :introduction, length: { maximum: 500 }

  validates :password, length: { minimum: 8 }

  has_secure_password

  def age
    birthday.present? ? ((Date.today - birthday) / 365).floor : nil
  end

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest token.to_s
  end

  private

  def birthday_cannot_be_later_than_today
    if birthday.present? && birthday > Date.today
      errors.add :birthday, '不能晚于今天'
    end
  end

  def make_attributes_downcase
    name.downcase!
    email.downcase!
  end

  def create_remember_token
    self.remember_token = User.encrypt User.new_remember_token
  end
end
