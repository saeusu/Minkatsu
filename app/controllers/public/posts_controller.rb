class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  
  def new
    @post = Post.new
  end
  
  def index
    @post = Post.new
    @posts = Post.all
  end
  
  def show
    @post = Post.includes(:user).find(params[:id])
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      @post.name = ""
      @post.price = ""
      
      @post.body = ""
      @post.genre.name = ""
      flash[:notice] = "投稿が成功しました"
      redirect_to post_path(@post)
    else
      @posts = Post.all
      render :new
    end
  end
  
  def edit
    @post = Post.find(params[:id])

  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      puts "更新に成功しました"
      @post.name = ""
      @post.price = ""
      @post.body = ""
      flash[:notice] = "編集が成功しました"
      redirect_to post_path(@post.id)
    else
      puts "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    if @post.user_id == current_user.id
      @post.destroy
      redirect_to posts_path
      flash[:notice] = "投稿を削除しました"
    else
      redirect_to posts_path
      flash[:alert] = "他人の投稿は削除できません"
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:name, :price, :body, :image, :genre_id)
  end
  
  def ensure_correct_user
    @post = Post.find(params[:id])
    unless @post.user_id == current_user.id
      redirect_to posts_path
    end
  end

end
