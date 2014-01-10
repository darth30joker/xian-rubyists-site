# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  full_name       :string(255)
#  email           :string(255)
#  birthday        :date
#  created_at      :datetime
#  updated_at      :datetime
#  introduction    :text
#  password_digest :string(255)
#  remember_token  :string(255)
#

require 'spec_helper'

describe User do

  it { should have_db_index(:name) }
  it { should have_db_index(:email) }
  it { should have_db_index(:remember_token) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:full_name) }
  it { should validate_presence_of(:email) }

  it { should ensure_length_of(:name).is_at_most(25) }
  it { should ensure_length_of(:full_name).is_at_most(50) }
  it { should ensure_length_of(:introduction).is_at_most(500) }
  it { should ensure_length_of(:password).is_at_least(8) }

  it do
    allow_value(
      'example', 'example0', 'ex-ample',
      'ex_ample', '_example', '-example'
      ).for(:name)
  end

  # These "should_not alow_value('xxx')" code are vary bad.
  # But they are the shoulda-matchers's problem, you can see:
  # https://github.com/thoughtbot/shoulda-matchers/issues/175
  it { should_not allow_value('example.').for(:name) }
  it { should_not allow_value('ex.ample').for(:name) }
  it { should_not allow_value('.example').for(:name) }
  it { should_not allow_value('example*').for(:name) }
  it { should_not allow_value('example@').for(:name) }
  it { should_not allow_value('example#').for(:name) }

  it do
    should allow_value(
      'user@foo.COM', 'A_US-ER@f.b.org',
      'frst.lst@foo.jp', 'a+b@baz.cn'
      ).for(:email)
  end

  # These "should_not alow_value('xxx')" code are vary bad.
  # But they are the shoulda-matchers's problem, you can see:
  # https://github.com/thoughtbot/shoulda-matchers/issues/175
  it { should_not allow_value('user@foo,com').for(:email) }
  it { should_not allow_value('user_at_foo.org').for(:email) }
  it { should_not allow_value('example.user@foo.').for(:email) }
  it { should_not allow_value('foo@bar_baz.com').for(:email) }
  it { should_not allow_value('foo@bar+baz.com').for(:email) }

  it { should have_secure_password }

  describe 'validate uniqueness' do
    before { create(:user) }

    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  before do
    @user = User.new(name: 'example',
                     full_name: 'Example User',
                     email: 'user@example.com',
                     birthday: Date.new(1984, 6, 1),
                     password: 'xianrubyist',
                     password_confirmation: 'xianrubyist')
  end

  subject { @user }

  it 'initialize correctly' do
    expect(@user).to be_valid
    expect(@user.remember_token).to be_blank
  end

  describe '#name' do

    it 'should be downcase after save' do
      uppercase_name = @user.name.upcase
      @user.name = uppercase_name
      @user.save
      expect(@user.name).to eq uppercase_name.downcase
    end
  end

  describe '#email' do

    it 'should be downcase after save' do
      uppercase_email = @user.email.upcase
      @user.email = uppercase_email
      @user.save
      expect(@user.email).to eq uppercase_email.downcase
    end
  end

  describe '#birthday' do

    it 'should not later than today' do
      @user.birthday = Date.tomorrow
      expect(@user).not_to be_valid
    end
  end

  describe '#age' do

    context 'when #birthday present' do

      it 'should return correct age' do
        user_age = ((Date.today - @user.birthday) / 365).floor
        expect(@user.age).to eq user_age
      end
    end

    context 'when #birthday not present' do
      before { @user.birthday = nil }

      it 'should be nil' do
        expect(@user.age).to be_nil
      end
    end
  end

  describe '#remember_token' do

    it 'should not be blank after save' do
      @user.save
      expect(@user.remember_token).not_to be_blank
    end
  end
end
