class Public::NotificationsController < ApplicationController
  before_action :authenticate_user!
    
  def index
    @notifications = current_user.notifications.order(created_at: :desc)
    @unread_notifications_exist = @notifications.exists?(checked: false)
  end

  def mark_as_read
    notification = current_user.notifications.find(params[:id])

    if notification.update(checked: true)
      redirect_to notifications_path, notice: "通知を既読にしました。"
    else
      redirect_to notifications_path, alert: "通知の更新に失敗しました。"
    end
  end
end
