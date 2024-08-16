class Post < ApplicationRecord
  has_one_attached :image

  belongs_to :user

  validates :image, presence: true  
  validates :name, presence: true
  validates :body, presence: true
  validates :price, presence: true
  
  def self.search_for(content, method)
    if method == 'perfect'
      Post.where(name: content)
    elsif method == 'forward'
      Post.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      Post.where('name LIKE ?', '%' + content)
    else
      Post.where('name LIKE ?', '%' + content + '%')
    end
  end

end
