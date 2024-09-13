class Favorite < ApplicationRecord
  after_create :create_notification
  
  belongs_to :user
  belongs_to :post
  has_many :notifications, as: :notifiable, dependent: :destroy
  
  validates :user_id, uniqueness: {scope: :post_id}
  
  private
  def create_notification
    Notification.create(
      user: self.post.user, # 通知を受け取るユーザー
      notifiable: self
    )
  end
end
