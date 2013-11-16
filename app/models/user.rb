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
  before_save :make_attributes_downcase

  validate :birthday_cannot_be_later_than_today

  # From GitHub's username regex
  VALID_NAME_REGEX = /\A([a-z0-9\_\-])+\z/ix
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false },
                   length: { maximum: 25 },
                   format: { with: VALID_NAME_REGEX }

  validates :fullname, presence: true,
                       length: { maximum: 50 }

  # Email
  # From the email regex research: http://fightingforalostcause.net/misc/2006/compare-email-regex.php
  # Authors: James Watts and Francisco Jose Martin Moreno
  VALID_EMAIL_REGEX = /\A([\w\!\#\z\%\&\'\*\+\-\/\=\?\\A\`{\|\}\~]+\.)*[\w\+-]+@((((([a-z0-9]{1}[a-z0-9\-]{0,62}[a-z0-9]{1})|[a-z])\.)+[a-z]{2,6})|(\d{1,3}\.){3}\d{1,3}(\:\d{1,5})?)\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }

  validates :introduction, length: { maximum: 300 }

  validates :password, length: { minimum: 8 }

  has_secure_password

  def age
    birthday.present? ? ((Date.today - birthday) / 365).floor : nil
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
end
