class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :ensure_guest_user, only: [:index, :create, :update]

  
  def index
    if guest_user?
      redirect_guest_user
    else
      @favorites = current_user.favorites.includes(:post)
    end  
  end
  
  def create
    if guest_user?
      redirect_guest_user
    else
      post = Post.find(params[:post_id])
      @favorite = current_user.favorites.new(post_id: post.id)
      @favorite.save
      render 'replace_btn'
    end  
  end

  def destroy
    if guest_user?
      redirect_guest_user
    else
      post = Post.find(params[:post_id])
      @favorite = current_user.favorites.find_by(post_id: post.id)
      @favorite.destroy
      render 'replace_btn'
    end  
  end
  
private

  def ensure_guest_user
    redirect_guest_user if guest_user?
  end

  def guest_user?
    current_user.email == "guest@example.com"
  end

  def redirect_guest_user
    redirect_to mypage_path, alert: "ゲストユーザーはいいねできません。会員登録をしてください。"
  end
end
