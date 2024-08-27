class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user, except: [:show]
  before_action :ensure_guest_user, only: [:edit]
  
  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
     
    if @user == current_user
      redirect_to mypage_path
    end
  end
  
  def mypage
    @posts = Post.where(user_id: current_user.id)
  end
  
  def edit
  end 
  
  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "更新しました。"
      redirect_to mypage_path
    else
      flash.now[:alert] = "エラーメッセージ"
      render :edit
    end
  end 
  
  def unsubscribe
    @user = current_user
  end 
  
  def withdraw
    @user.update(is_deleted: true)
    reset_session
    redirect_to new_user_registration_path
  end
  
  private
  
  def set_current_user
    @user = current_user
  end
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.email == "guest@example.com"
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end
  
  def guest_user?
    email == GUEST_USER_EMAIL
  end
  
  def user_params
    params.require(:user).permit(:name, :nickname, :email, :password)
  end 
end
