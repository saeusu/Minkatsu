class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  
  def new
    @post = Post.new
  end
  
  def index
    @post = Post.new
    @posts = Post.all
    @user = current_user
  end
  
  def show
    @user = current_user
    @post = Post.find(params[:id])
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      @post.name = ""
      @post.price = ""
      @post.body = ""
      redirect_to post_path(@post), notice: "You have created book successfully."
    else
      # @user = current_user
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
      @post.name = ""
      @post.price = ""
      @post.body = ""
      redirect_to post_path(@post.id), notice: "You have updated book successfully."
    else
      render :edit
    end
  end 
  
  def destroy
    if @post.customer_id == current_customer.id
      @post.destroy
      redirect_to posts_path
      flash[:notice] = "投稿を削除しました"
    else
      redirect_to posts_path
      flash[:alert] = "他人の投稿は削除できません"
    end
  end
  
   private
  # ストロングパラメータ
  def post_params
    params.require(:post).permit(:name, :price, :body, :image)
  end
  
  def ensure_correct_user
    @post = Post.find(params[:id])
    unless @post.user_id == current_user.id
      redirect_to posts_path
    end
  end

end
