class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:create, :destroy]

  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user)
  end
  
  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(@user)
  end
  
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
  
  private  
  
  def ensure_guest_user
    # current_user がゲストユーザーの場合のみ制限する
    if current_user.email == "guest@example.com"
      redirect_to mypage_path, alert: "ゲストユーザーはフォローできません。会員登録をしてください。"
    end
  end
end