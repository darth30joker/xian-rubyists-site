class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github

    @user = User.find_for_github_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "GitHub" if is_navigational_format?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
    else
      session["devise.github_data"] = request.env["omniauth.auth"]
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "GitHub" if is_navigational_format?
      redirect_to new_user_registration_url
    end
  end
end