class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @comment = Comment.find(params[:id])
  end
  
  def index
    @comments = Comment.includes(:user).all
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_comments_path, notice: 'コメントが削除されました。'
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
