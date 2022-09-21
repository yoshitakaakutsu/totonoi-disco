class Public::SearchsController < ApplicationController
    
  def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    @records = search_for(@model, @content, @method)
  end

  private
  def search_for(model, content, method)
    if model == 'user'
      if method == 'perfect'
        User.where(nickname: content)
      else
        User.where('nickname LIKE ?', '%'+content+'%')
      end
    elsif model == 'post'
      if method == 'perfect'
        Post.where(text: content)
      else
        Post.where('text LIKE ?', '%'+content+'%')
      end
    end
  end
  
end
