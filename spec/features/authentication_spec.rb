require 'spec_helper'

feature 'Authentication' do

  subject { page }

  context 'user signin' do

    before { visit signin_path }
    let(:submit) { '登录' }

    scenario { should have_title full_title('登录') }

    scenario 'with invalid infomation' do

      click_button submit

      expect(page).to have_title full_title('登录')
      expect(page).to have_content '登录错误'
    end

    context 'with valid infomation' do

      let(:user) { create(:user) }

      before { sign_in user }

      scenario 'should signin' do
        expect(page).to have_link user.name, href: user_path(user)
        expect(page).to have_link '个人设置', href: edit_user_path(user)
        expect(page).to have_link '退出'

        expect(page).not_to have_link '登录'
        expect(page).not_to have_link '注册'

        expect(page).to have_content '登录成功'
      end

      scenario 'can signout' do
        click_link '退出'
        expect(page).to have_link '登录'
        expect(page).to have_content '您已退出登录'
      end
    end
  end
end
