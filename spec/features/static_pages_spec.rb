require 'spec_helper'

feature 'Static Pages' do

  subject { page }

  shared_examples_for 'all static pages' do
    it { should have_content(heading) }
    it { should have_title(full_title(page_title)) }
  end

  scenario 'should have the right links on the layout' do
    visit root_path
    expect(page).to have_link '西安Rubyist社区', href: root_path
    expect(page).to have_link '首页', href: root_path
    expect(page).to have_link '认证会员', href: '#'
    expect(page).to have_link '社区活动', href: '#'
    expect(page).to have_link '关于我们', href: about_path
    expect(page).to have_link '联系我们', href: contact_path
    expect(page).to have_link '注册', href: '#'
    expect(page).to have_link '登录', href: '#'
  end

  context 'Home page' do
    before { visit root_path }
    let(:heading) { '西安Rubyist社区' }
    let(:page_title) { '' }

    it_should_behave_like 'all static pages'
    scenario { should_not have_title '| 首页' }
  end

  context 'About page' do
    before { visit about_path }
    let(:heading) { '关于我们' }
    let(:page_title) { '关于我们' }

    it_should_behave_like 'all static pages'
  end

  context 'Contact page' do
    before { visit contact_path }
    let(:heading) { '联系我们' }
    let(:page_title) { '联系我们' }

    it_should_behave_like 'all static pages'
  end
end
