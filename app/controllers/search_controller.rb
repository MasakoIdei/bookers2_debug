class SearchController < ApplicationController
  before_action :authenticate_user!
  
  def search
    #view画面に検索したワードを表示するために定義
    @word = params[:word]
    
    # searchのフォームで、送信された内容から必要な中身を取り出して代入
    @range = params[:range]
    # もし、range(タブで選択)==Userだったら
    if @range == "User" 
      @renge = params[:range]
      @users = User.looks(params[:search],params[:word])
    else
      # range(タブで選択)==Userではない場合は
      @books = Book.looks(params[:search],params[:word])
    end
  end
  
end
