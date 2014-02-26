require 'spec_helper'

feature 'Static Pages' do

  subject { page }

  scenario 'should have the correct links on the layout' do
    visit root_path

    expect(page).to have_link '西安Rubyist社区', href: root_path
    expect(page).to have_link '首页', href: root_path
    expect(page).to have_link '认证会员', href: '#'
    expect(page).to have_link '社区活动', href: '#'
    expect(page).to have_link '关于我们', href: about_path
    expect(page).to have_link '联系我们', href: contact_path

    pending 'need to implement signup/signin' do
      expect(page).to have_link '注册', href: signup_path
      expect(page).to have_link '登录', href: signin_path
    end
  end

  context 'home page' do
    before { visit root_path }

    scenario { should have_title(full_title('')) }
    scenario { should_not have_title '| 首页' }
  end

  context 'about page' do
    before { visit about_path }

    scenario { should have_title full_title('关于我们') }
  end

  context 'contact page' do
    before { visit contact_path }

    scenario { should have_title full_title('联系我们') }
  end
end
