class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :user_with_permission, only: [:edit, :update]

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      sign_in @user
      flash[:success] = '注册成功，欢迎加入西安Rubyist社区！'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update

  end

  private

    def user_params
      params.require(:user).permit(:name,
                                   :fullname,
                                   :email,
                                   :birthday,
                                   :password,
                                   :password_confirmation)
    end

    def user_with_permission
      @user = User.find params[:id]
      unless current_user?(@user)
        flash[:danger] = "错误：您没有该操作的权限!"
        redirect_to root_path
      end
    end
end
