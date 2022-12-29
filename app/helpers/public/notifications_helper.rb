module Public::NotificationsHelper
  def unchecked_notifications
    @notifications=current_user.passive_notifications.where(checked: false)
  end

  def notification_form(notification)
    @comment=nil
    visitor=link_to notification.visitor.nickname, public_user_path(notification.visitor.id), style:"font-weight: bold;"
    your_post=link_to 'あなたの投稿', public_post_path(notification.post.id), style:"font-weight: bold;", remote: true
    case notification.action
      when "good" then
        "#{visitor}が#{your_post}にいいね！しました"
      when "comment" then
        @comment=Comment.find_by(id:notification.comment_id)&.comment
        "#{visitor}が#{your_post}にコメントしました"
    end
  end
end
