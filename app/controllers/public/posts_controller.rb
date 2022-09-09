class Public::PostsController < ApplicationController
  def index
      @posts= Post.page(params[:page]).per(5).order(id: "DESC").where(status: :published)
  end
  
  def new
    @post = Post.new
  end
  
  def  create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to public_posts_path
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end
  
  def confirm
    @posts = current_user.posts.where(status: :draft)
  end
  
  def edit
    @posts = Post.find(params[:id])
  end  
  
  def update
    @posts = Post.find(params[:id])
    @posts.update(post_params)
    redirect_to public_posts_path
  end
  
  
  def search
    if params[:keyword].present?
      @post = Post.where('text LIKE ?', "%#{params[:keyword]}%")
      @keyword = params[:keyword]
    else
      @post = Post.all
    end
  end

  
  private
  
  def post_params
    params.require(:post).permit(:sauna,:text, :status)
  end
end
