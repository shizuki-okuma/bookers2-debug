class BookCommentsController < ApplicationController
  
  def create
    @book = Book.find(params[:book_id])
    @user = @book.user
    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.book_id = @book.id
    if @book_comment.save
    # redirect_to book_path(@book)
    render "create"
    else
    redirect_to book_path(@book),notice:"コメントを入力してください"
    end
  end
  
  def destroy
    Book.find(params[:id]).destroy
    redirect_to book_path(params[:book.id])
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
  
 
end
