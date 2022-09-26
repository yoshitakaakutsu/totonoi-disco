class Public::SearchsController < ApplicationController
    
  def search
    @model = params["model"]
    @content = params["content"]
    @records = search_for(@model, @content)
  end

  private
  def search_for(model, content)
    if model == 'user'
      User.where('nickname LIKE ?', '%'+content+'%')
    elsif model == 'sauna'
      Post.where('sauna LIKE ?', '%'+content+'%')
    elsif model == 'keyword'
      Post.where('text LIKE ?', '%'+content+'%')
    end
  end
end
