class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  #ユーザ登録用フォーム
  def new
    @user = User.new
  end

  #ユーザ登録操作
  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to root_url
    else
      flash[:danger] = "ユーザの登録に失敗しました。"
      render :new
    end
  end
  
  private
  #user_paramsの定義
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
