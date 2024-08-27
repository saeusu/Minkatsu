class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:create, :update]
  
  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
		redirect_to request.referer
  end
  
  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(user)
		redirect_to request.referer
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
    @user = User.find(params[:user_id])
    unless @user.email == "guest@example.com"
      redirect_to mypage_path, alert: "ゲストユーザーはフォローできません。会員登録をしてください。"
    end
  end
end