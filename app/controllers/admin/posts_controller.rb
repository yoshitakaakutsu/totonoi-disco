class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: "DESC").where(status: :published)
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end
  
  def destroy
    @posts = Post.find(params[:id])
    @posts.destroy
    redirect_to admin_posts_path
  end
  
  def post_params
    params.require(:post).permit(:sauna,:text, :status)
  end
end
