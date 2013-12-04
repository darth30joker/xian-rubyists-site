require 'spec_helper'

feature 'Authentication' do

  subject { page }

  context 'user signin' do

    before { visit signin_path }
    let(:submit) { '登陆' }

    scenario { should have_title full_title('登陆') }

    scenario 'with invalid infomation' do

      click_button submit

      expect(page).to have_title full_title('登陆')
      expect(page).to have_content '登陆错误'
    end

    scenario 'with valid infomation' do
      user = create(:user)

      fill_in '用户名', with: user.name
      fill_in '密码', with: user.password

      click_button submit

      expect(page).to have_link user.name
      expect(page).to have_link '个人资料'
      expect(page).to have_link '退出'

      expect(page).not_to have_link '登陆'
      expect(page).not_to have_link '注册'

      expect(page).to have_content '登陆成功'
    end
  end
end
