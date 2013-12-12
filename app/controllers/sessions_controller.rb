class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by name: params[:session][:name]
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = '登录成功：欢迎回来！'
      # redirect_back_or root_path
      redirect_to root_path
    else
      flash.now[:danger] = '登录错误：无效的用户名或密码！'
      render 'new'
    end
  end

  def destroy
    sign_out
    flash[:success] = '您已退出登录，下次再见！'
    redirect_to root_path
  end
end
