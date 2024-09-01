class Public::CommentsController < ApplicationController
  # def create
  #   post = Post.find(params[:post_id])
  #   @comment.score = Language.get_data(comment_params[:comment])
  #   @comment = current_user.comments.new(comment_params)
  #   @comment.post_id = post.id
  #   @comment.save
  # end
  
  def create
    post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)  # 先に@commentを定義
    @comment.post_id = post.id
    @comment.score = Language.get_data(comment_params[:comment])  # その後にscoreを設定
    @comment.save
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:comment)
  end
end