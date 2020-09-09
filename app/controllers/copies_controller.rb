class CopiesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @copy = @book.copies.new(copy_params)
    if @copy.save
      redirect_to @book
    else 
      render 'books/show'
    end
  end
  private
    def copy_params
      params.require(:copy).permit(:borrower,:due_date)
    end
end
