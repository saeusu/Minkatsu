class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :notifications, as: :notifiable, dependent: :destroy
  
  validates :comment, presence: true, length: {maximum: 200 }
  
  def self.search_for(content, method)
    if method == 'perfect'
      Comment.where(comment: content)
    elsif method == 'forward'
      Comment.where('comment LIKE ?', content + '%')
    elsif method == 'backward'
      Comment.where('comment LIKE ?', '%' + content)
    else
      Comment.where('comment LIKE ?', '%' + content + '%')
    end
  end
  
  private
  def create_notification
    Notification.create(
      user: self.post.user,
      notifiable: self
      )
  end    
  
end
