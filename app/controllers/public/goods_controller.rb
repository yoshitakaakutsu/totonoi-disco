class Public::GoodsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :post_params, only: [:create, :destroy]


  def create
    Good.create(user_id: current_user.id, post_id: @post.id)
    redirect_to request.referer
    @post.create_notification_good!(current_user)
  end

  def destroy
    good = Good.find_by(user_id: current_user.id, post_id: @post.id)
    good.destroy
    redirect_to request.referer
  end

  private

  def post_params
    @post = Post.find(params[:post_id])
  end

end
