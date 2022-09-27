class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @post = @user.posts.page(params[:page]).per(5).order(id: "DESC").where(status: :published)
  end

  def edit
    @user = User.find(params[:id])
  end
 

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to admin_user_path(user.id)
  end
  
   def destroy
    @user = User.find(params[:id]) 
    @user.destroy
    flash[:notice] = '退会処理を実行いたしました。'
    redirect_to root_path 
  end


private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :email, :profile_image, :is_deleted)
  end
end
