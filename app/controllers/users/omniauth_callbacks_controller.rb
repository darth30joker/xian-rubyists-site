class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github

    @user = User.find_for_github_oauth(request.env['omniauth.auth'], current_user)

    if @user.persisted?
      show_github_flash_notice
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
    else
      session['devise.github_data'] = env['omniauth.auth'].except('extra')
      show_github_flash_notice
      redirect_to new_user_registration_url
    end
  end

  private

    def show_github_flash_notice
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'GitHub' if is_navigational_format?
    end
end