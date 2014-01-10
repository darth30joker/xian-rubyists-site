require 'spec_helper'

feature 'User Management' do

  subject { page }

  context 'user signup' do

    before { visit signup_path }
    let(:submit) { '注册' }

    scenario { should have_title full_title('注册') }

    scenario 'with invalid infomation' do
      expect { click_button submit }.not_to change(User, :count)

      expect(page).to have_title full_title('注册')
      expect(page).to have_content '提交错误'
    end

    scenario 'with valid infomation' do
      user = build(:user)

      expect {
        fill_in '用户名', with: user.name
        fill_in '全名', with: user.fullname
        fill_in '电子邮件', with: user.email
        fill_in '密码', with: user.password
        fill_in '确认密码', with: user.password_confirmation

        click_button submit
      }.to change(User, :count).by(1)

      expect(current_path).to eq root_path
      expect(page).to have_link('退出')
      expect(page).to have_content '注册成功'
    end
  end

  context 'user profile' do

    let(:user) { create(:user) }

    before { visit user_path user }

    scenario 'should show corrct information' do
      expect(page).to have_title full_title("#{user.fullname} - 个人资料")
      expect(page).to have_content user.name
      expect(page).to have_content user.fullname
      expect(page).to have_content user.age
      expect(page).to have_content user.introduction
    end
  end

  context 'edit user' do

    let(:user) { create(:user) }

    scenario 'when not signed in' do
      visit edit_user_path user

      expect(page.current_path).to eq signin_path
    end

    scenario 'when not the signed in user' do
      other_user = create(:user)
      sign_in other_user
      visit edit_user_path user

      expect(page.current_path).to eq root_path
    end

    context 'when signed in and is the same user' do

      before do
        sign_in user
        visit edit_user_path user
      end

      scenario { should have_title full_title("#{user.fullname} - 个人设置") }
    end
  end
end
