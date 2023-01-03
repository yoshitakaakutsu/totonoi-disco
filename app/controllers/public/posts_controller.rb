class Public::PostsController < ApplicationController
  def index
    @posts= Post.page(params[:page]).per(10).order(id: "DESC").where(status: :published)
  end

  def new
    @post = Post.new
  end

  def  create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.status == "published"
      if @post.save
        redirect_to public_posts_path
      else
        render :new
      end
    elsif @post.status == "draft"
      if @post.save
        redirect_to confirm_public_post_path(current_user.id)
      else
        render :new
      end
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.status == "published"
      @post.destroy
      redirect_to public_posts_path
    else
      @post.destroy
      redirect_to confirm_public_post_path(current_user.id)
    end
  end

  def confirm
    @posts = current_user.posts.order(id: "DESC").where(status: :draft)
  end

  def edit
    @posts = Post.find(params[:id])
  end

  def update
    @posts = Post.find(params[:id])
    if @posts.status == "draft"
      @posts.update(post_params)
      redirect_to confirm_public_post_path(current_user.id)
    else
      @posts.update(post_params)
      redirect_to public_posts_path
    end
  end


  def search
    @post = Post.search(params[:keyword])
    @keyword = params[:keyword]
  end


  private

  def post_params
    params.require(:post).permit(:sauna,:text, :status, :adress, :latitude, :longitude)
  end
end
