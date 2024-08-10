class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user
  
  def show
    @posts = Post.where(user_id: current_user.id)
  end 
  
  def edit
  end 
  
  def update
    if @user.update(user_params)
      redirect_to mypage_path, notice: '会員情報の更新が完了しました。'
    else
      render :edit
    end
  end 
  
  def unsubscribe
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
  
  def user_params
    params.require(:user).permit(:name, :nickname, :email, :password)
  end 
end
