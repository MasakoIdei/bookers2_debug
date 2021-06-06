class Book < ApplicationRecord
	belongs_to :user,optional: true
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy
    
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
	
	def favorited_by?(user)#いいね機能のviewで使う
	    favorites.where(user_id: user.id).exists?
	end
    
     # searchとwordの引数を受けとる
  def self.looks(searches, words)
    if searches == "perfect_match"#完全一致
       @book = Book.where("title Like ?","#{words}")#("カラム名 Like ?")
    elsif searches == "forward_match"#前方一致
       @book = Book.where("title Like ?","#{words}%")
    elsif searches == "backward_match"#後方一致
       @book = Book.where("title Like ?","%#{words}")
    elsif searches == "partial_match"#部分一致#部分一致
       @book = Book.where("title Like ?","%#{words}%")
    end
  end
  
end
