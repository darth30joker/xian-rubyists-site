require 'spec_helper'

feature 'Authentication' do

  subject { page }

  context 'user signin' do

    before { visit signin_path }

    scenario { should have_title full_title('登陆') }
  end
end
