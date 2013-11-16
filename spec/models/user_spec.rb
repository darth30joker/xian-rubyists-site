require 'spec_helper'

describe User do

  before do
    @user = User.new(name: 'example',
                     fullname: 'Example User',
                     email: 'user@example.com',
                     birthday: Date.new(1984, 6, 1),
                     password: 'xianrubyist',
                     password_confirmation: 'xianrubyist')
  end

  subject { @user }

  it 'has correct instance methods' do
    expect(@user).to respond_to :name
    expect(@user).to respond_to :fullname
    expect(@user).to respond_to :email
    expect(@user).to respond_to :birthday
    expect(@user).to respond_to :age
    expect(@user).to respond_to :introduction
    expect(@user).to respond_to :password_digest
    expect(@user).to respond_to :password
    expect(@user).to respond_to :password_confirmation
  end

  it 'initialize correctly' do
    expect(@user).to be_valid
  end

  describe '#name' do

    context 'when present' do

      it 'maximum length should be 25' do
        @user.name = 'a' * 25
        expect(@user).to be_valid
        @user.name = 'a' * 26
        expect(@user).not_to be_valid
      end

      it 'should be unique' do
        create(:user, name: @user.name)
        expect(@user).not_to be_valid
      end

      it 'should be unique and case-insensitive' do
        create(:user, name: @user.name.upcase)
        expect(@user).not_to be_valid
      end

      it 'should be downcase after save' do
        uppercase_name = @user.name.upcase
        @user.name = uppercase_name
        @user.save
        expect(@user.name).to eq uppercase_name.downcase
      end

      it 'format should be valid' do
        invalid_names = %w[example. ex.ample .example example* example@ example#]
        invalid_names.each do |invalid_name|
          @user.name = invalid_name
          expect(@user).not_to be_valid
        end

        valid_names = %w[example example0 ex-ample ex_ample _example -example]
        valid_names.each do |valid_name|
          @user.name = valid_name
          expect(@user).to be_valid
        end
      end
    end

    context 'when not present' do
      before { @user.name = '' }

      it { should_not be_valid }
    end
  end

  describe '#fullname' do

    context 'when present' do

      it 'maximum length should be 50' do
        @user.fullname = 'a' * 50
        expect(@user).to be_valid
        @user.fullname = 'a' * 51
        expect(@user).not_to be_valid
      end
    end

    context 'when not present' do
      before { @user.fullname = '' }

      it { should_not be_valid }
    end
  end

  describe '#email' do

    context 'when present' do

      it 'format should be valid' do
        invalid_addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
        invalid_addresses.each do |invalid_address|
          @user.email = invalid_address
          expect(@user).not_to be_valid
        end

        valid_addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
        valid_addresses.each do |valid_address|
          @user.email = valid_address
          expect(@user).to be_valid
        end
      end

      it 'should be unique' do
        create(:user, email: @user.email)
        expect(@user).not_to be_valid
      end

      it 'should be unique and case-insensitive' do
        create(:user, email: @user.email.upcase)
        expect(@user).not_to be_valid
      end

      it 'should be downcase after save' do
        uppercase_email = @user.email.upcase
        @user.email = uppercase_email
        @user.save
        expect(@user.email).to eq uppercase_email.downcase
      end
    end

    context 'when not present' do
      before { @user.email = '' }

      it { should_not be_valid }
    end
  end

  describe '#birthday' do

    context 'when present' do

      it 'should not later than today' do
        @user.birthday = Date.tomorrow
        expect(@user).not_to be_valid
      end
    end

    context 'when not present' do
      before { @user.birthday = nil }

      it { should be_valid }
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

  describe '#introduction' do

    context 'when present' do

      it 'maximum length should be 300' do
        @user.introduction = 'a' * 300
        expect(@user).to be_valid
        @user.introduction = 'a' * 301
        expect(@user).not_to be_valid
      end
    end

    context 'when not present' do
      before { @user.introduction = '' }

      it { should be_valid }
    end
  end

  pending 'test security'

end
