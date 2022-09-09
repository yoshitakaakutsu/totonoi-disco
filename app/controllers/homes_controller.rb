class HomesController < ApplicationController
  def top
     @posts = Post.page(params[:page]).per(5).order(id: "DESC").where(status: :published)
  end
  
  def about
  end
end
