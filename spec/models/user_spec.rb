require 'spec_helper'

describe User do

  before do
    @user = User.new(name: 'Example User',
                     fullname: 'example',
                     email: 'user@example.com',
                     birthday: Date.new(1984, 6, 1),
                     password: 'foobar',
                     password_confirmation: 'foobar')
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
      pending 'maxinum length should be 25'
      pending 'format should be valid'
      pending 'should be unique'
    end

    context 'when not present' do
      before { @user.name = '' }

      it { should_not be_valid }
    end
  end

  describe '#fullname' do

    context 'when present' do
      pending 'maxinum length should be 50'
      pending 'format should be valid'
    end

    context 'when not present' do
      before { @user.fullname = '' }

      it { should_not be_valid }
    end
  end

  describe '#email' do

    context 'when present' do
      pending 'format should be valid'
      pending 'should be unique'
    end

    context 'when not present' do
      before { @user.email = '' }

      it { should_not be_valid }
    end
  end

  describe '#birthday' do

    context 'when present' do
      before { @user.birthday = Date.tomorrow }

      it 'should not later than today' do
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
      let(:user_age) { ((Date.today - @user.birthday) / 365).floor }

      it 'should return correct age' do
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
      pending 'maxinum length should be 300'
    end

    context 'when not present' do
      before { @user.introduction = '' }

      it { should be_valid }
    end
  end

  pending 'test security'

end
