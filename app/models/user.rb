class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :notifications, dependent: :destroy
  
  # フォローしている関連付け
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # フォローされている関連付け
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # フォローしているユーザーを取得
  has_many :followings, through: :relationships, source: :followed
  # フォロワーを所得
  has_many :followers, through: :reverse_of_relationships, source: :follower

  # 指定したユーザーをフォローする
  def follow(user)
    relationships.create(followed_id: user.id)
  end

  # 指定したユーザーのフォローを解除する
  def unfollow(user)
    relationships.find_by(followed_id: user.id).destroy
  end

  # 指定したユーザーをフォローしているかどうかを判定
  def following?(user)
    followings.include?(user)
  end
  
  def user_status
    if is_deleted == true
      "退会"
    else
      "有効"
    end
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com', name: "guest") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.nickname = "Guest" # 修正: nicknameを設定
    end
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end

  def self.search_for(content, method)
    if method == 'perfect'
      User.where(nickname: content)
    elsif method == 'forward'
      User.where('nickname LIKE ?', content + '%')
    elsif method == 'backward'
      User.where('nickname LIKE ?', '%' + content)
    else
      User.where('nickname LIKE ?', '%' + content + '%')
    end
  end

  validates :name, presence: true
  validates :nickname, presence: true # nicknameに対するバリデーションが原因
end
