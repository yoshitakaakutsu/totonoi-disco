class Public::CommentsController < 
  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to root_path
  end

  private

  def post_comment_params
    params.require(:comment).permit(:comment)
  end
end
