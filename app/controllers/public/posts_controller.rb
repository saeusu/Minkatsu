class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  before_action :ensure_guest_user, only: [:new, :create, :edit, :update, :destroy]
  
  def new
    @post = Post.new
  end
  
  def show
    @post = Post.includes(:user).find(params[:id])
  end  
  
  def index
    @post = Post.new
    @posts = if params[:genre_id].present?
                Post.where(genre_id: params[:genre_id])
              else
                Post.all
              end
    
    @posts = if params[:sort] == 'old'
                @posts.order(created_at: :asc)
              else
                @posts.order(created_at: :desc)
              end  
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
      @post.name = ""
      @post.price = ""
      @post.body = ""
      flash[:notice] = "編集が成功しました"
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    if @post.user_id == current_user.id
      @post.destroy
      redirect_to posts_path
      flash[:notice] = "投稿を削除しました"
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
  
  def ensure_guest_user
    if current_user.email == "guest@example.com"
      redirect_to posts_path, alert: "ゲストユーザーは新規投稿できません。会員登録をしてください。"
    end
  end

end
