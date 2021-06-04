class PostCommentsController < ApplicationController
    def create
        @book = Book.find(params[:book_id])
        comment = current_user.post_comments.new(post_comment_params)
        comment.book_id = @book.id
        comment.save
        redirect_back(fallback_location:root_path)
    end
    
    def destroy
        @book = Book.find(params[:book_id])
        comment_d = PostComment.find_by(params[:id])#コメントを見つけてくる
        comment_d.destroy
        redirect_back(fallback_location:root_path) 
    end
    
    private

    def post_comment_params
     params.require(:post_comment).permit(:comment)
    end

end