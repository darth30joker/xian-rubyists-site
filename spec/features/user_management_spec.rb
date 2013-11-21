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
      # expect(page).to have_content '错误'
    end

    scenario 'with valid infomation' do
      user = build(:user)

      expect {
        fill_in '用户名', with: user.name
        fill_in '全名', with: user.fullname
        fill_in '电子邮件', with: user.email
        fill_in '生日', with: user.birthday.to_s
        fill_in '密码', with: user.password
        fill_in '确认密码', with: user.password_confirmation

        click_button submit
      }.to change(User, :count).by(1)

      expect(current_path).to eq root_path
      # expect(page).to have_link('退出')
      # expect(page).to have_content '欢迎'
    end
  end
end
