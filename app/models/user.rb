class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books,  dependent: :destroy 
  attachment :profile_image, destroy: false
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  # foreign_key: "followed_id"でどのカラムを参照して欲しいのかを定義
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  # 被フォロー関係を通じて参照→followed_idをフォローしている人

  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 【class_name: "Relationship"】は省略可能。上と見た目を合わせるためにあえて記載
  has_many :followings, through: :relationships, source: :followed
  # 与フォロー関係を通じて参照→follower_idをフォローしている人
  
  # ユーザーをフォローする
  def follow(user_id)
   relationships.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す/フォロワーがフォローした時に出来たidを探してきてdestroy
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

 # フォローしていればtrueを返す
  def following?(user)
    followings.include?(user)
  end
  
  def self.looks(searches, words)
    if searches == "perfect_match"#完全一致
       @user = User.where("name Like ?","#{words}")
    elsif searches == "forward_match"#前方一致
       @user = User.where("name Like ?","#{words}%")
    elsif searches == "backward_match"#後方一致
       @user = User.where("name Like ?","%#{words}")
    elsif searches == "partial_match"#部分一致#部分一致
       @user = User.where("name Like ?","%#{words}%")
    end
  end


  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true
  validates :introduction, length: { maximum: 50 }
  
end
