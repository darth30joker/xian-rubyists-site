class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :user_with_permission, only: [:edit, :update]

  def show
    @user = User.find_by id: params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      sign_in @user
      flash[:success] = '注册成功，欢迎加入西安Rubyist社区！'
      # redirect_back_or root_path
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    # @user = User.find_by id: params[:id]
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
      @user = User.find_by id: params[:id]
      redirect_to root_path unless current_user == @user
    end
end
