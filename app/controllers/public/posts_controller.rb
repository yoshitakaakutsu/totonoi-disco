class Public::PostsController < ApplicationController
  def index
  end
  
  def new
    @post = Post.new
  end
  
  def  create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to root_path
  end
  
  def show
  end
  
  private
  
  def post_params
    params.require(:post).permit(:sauna,:text)
  end
end
