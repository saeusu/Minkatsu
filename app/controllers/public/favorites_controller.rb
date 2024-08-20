class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!, only: :index
  
  def index
    @favorites = current_user.favorites.includes(:post)
  end
  
  def create
    post = Post.find(params[:post_id])
    @favorite = current_user.favorites.new(post_id: post.id)
    @favorite.save
    render 'replace_btn'
  end

  def destroy
    post = Post.find(params[:post_id])
    @favorite = current_user.favorites.find_by(post_id: post.id)
    @favorite.destroy
    render 'replace_btn'
  end 
end 