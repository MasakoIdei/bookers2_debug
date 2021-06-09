class FavoritesController < ApplicationController
    def create
     @book = Book.find(params[:book_id])
     @favorite = current_user.favorites.new(book_id: @book.id)
     @favorite.save
     # 非同期通信化の為コメントアウト↓
      # redirect_back(fallback_location:root_path)#直前のページへとリダイレクトさせる
    end
    
    def destroy
     @book = Book.find(params[:book_id])
     @favorite = current_user.favorites.find_by(book_id: @book.id)
     @favorite.destroy
     # 非同期通信化の為コメントアウト↓
     # redirect_back(fallback_location:root_path)#直前のページへとリダイレクトさせる
    end
end
