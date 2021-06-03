class Book < ApplicationRecord
	belongs_to :user,optional: true
	has_many :favorites, dependent: :destroy
    
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
	
	def favorited_by?(user)
	    favorites.where(user_id: user.id).exists?
	end
    #いいね機能のviewで使う
end
