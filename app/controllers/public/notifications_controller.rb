class Public::NotificationsController < ApplicationController

  def index
    @notifications = current_user.passive_notifications

  end

  def destroy_all
    @notifications = current_user.passive_notifications.destroy_all
    redirect_to public_user_notifications_path(current_user.id)
  end



end
