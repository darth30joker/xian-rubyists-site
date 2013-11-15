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

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false },
                   length: { maximum: 25 }

  validates :fullname, presence: true,
                       length: { maximum: 50 }

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false }

  validates :introduction, length: { maximum: 300 }

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
