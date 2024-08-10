class Post < ApplicationRecord
  has_one_attached :image

  validates :image, presence: true  
  validates :name, presence: true
  validates :body, presence: true
  validates :price, presence: true

end
