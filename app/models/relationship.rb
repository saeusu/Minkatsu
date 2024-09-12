class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  has_many :notifications, as: :notifiable, dependent: :destroy
  
  after_create :create_notification
  
private  
  def create_notification
    Notification.create(
      user: followed, # 通知を受け取るユーザー（フォローされたユーザー）
      notifiable: self
    )
  end
end
