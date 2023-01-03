class Public::SearchsController < ApplicationController

  def search
    @model = params["model"]
    @content = params["content"]
    @records = search_for(@model, @content)
  end

  private
  def search_for(model, content)
    if model == 'user'
      User.order(id: "DESC").where('nickname LIKE ?', '%'+content+'%')
    elsif model == 'sauna'
      Post.page(params[:page]).per(5).order(id: "DESC").where('sauna LIKE ?', '%'+content+'%')
    elsif model == 'keyword'
      Post.page(params[:page]).per(5).order(id: "DESC").where('text LIKE ?', '%'+content+'%')
    end
  end
end