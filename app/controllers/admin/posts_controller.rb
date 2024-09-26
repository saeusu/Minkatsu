class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @post = Post.new
    @posts = Post.all

  end
  
  def show
    @post = Post.includes(:user).find(params[:id])
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
    flash[:notice] = "投稿を削除しました"
  end
  
  private
  
  def post_params
    params.require(:post).permit(:name, :price, :body, :image)
  end  
end
