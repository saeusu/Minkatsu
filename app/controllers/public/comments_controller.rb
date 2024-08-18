class Public::CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = post.id
    @comment.save
    redirect_to request.referer
  end

  def destroy
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to request.referer
    # @comment = Comment.find(params[:id])
    # @comment.destroy
    # redirect_to post_path
  end
  
private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
