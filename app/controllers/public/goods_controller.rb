class Public::GoodsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    good = current_user.goods.new(post_id: post.id)
    good.save
    post.create_notification_like!(current_user)
  end

  def destroy
    post = Post.find(params[:post_id])
    good = current_user.goods.find_by(post_id: post.id)
    good.destroy
  end

end
