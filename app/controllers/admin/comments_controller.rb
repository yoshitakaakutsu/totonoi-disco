class Admin::CommentsController < ApplicationController
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_posts_path(params[:post_id])
  end
  
  private

  def comment_params
    params.require(:comment).permit(:comment, :user_id, :post_id)
  end

end
