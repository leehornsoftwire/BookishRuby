class CopiesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @copy = @book.copies.new(copy_params)
    if @copy.save
      redirect_to @book
    else 
      render "books/show", id: params[:book_id]
    end
  end
  def update
    @copy = Copy.find(params[:id])
    @copy.update(copy_params)
    if @copy.save 
      redirect_to @copy.book
    else
      render 'edit'
    end
  end
  def edit 
    @copy = Copy.find(params[:id])
  end
  def destroy
    copy = Copy.find(params[:id])
    copy.destroy
    redirect_to book_path(copy.book_id)
  end
  private
    def copy_params
      params.require(:copy).permit(:borrower,:due_date)
    end
end
