class Public::NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.order(created_at: :desc)
  end
  
  def mark_as_read
    @notification = current_user.notification.find(params[:id])
    @notification.update(checked: true)
    redirect_to notifications_path
  end  
end
