class HomesController < ApplicationController
  def top
     @posts = Post.all.order(id: "DESC").where(status: :published)
  end
  
  def about
  end
end
