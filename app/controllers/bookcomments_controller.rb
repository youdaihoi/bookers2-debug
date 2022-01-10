class BookcommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    comment = current_user.bookcomments.new(bookcomment_params)
    comment.book_id = @book.id
    comment.save

  end

  def destroy
    @book = Book.find(params[:book_id])
    Bookcomment.find_by(id: params[:id], book_id: params[:book_id]).destroy

  end

  private

  def bookcomment_params
    params.require(:bookcomment).permit(:comment)
  end
end
