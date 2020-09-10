class CopiesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @copy = @book.copies.new(user_id: nil, due_date: nil)
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
      render "edit"
    end
  end

  def checkout 
    @copy = Copy.find(params[:id])
    @copy.user_id = current_user.id
    @copy.save
    redirect_to book_path(@copy.book_id)
  end

  def return 
    @copy = Copy.find(params[:id])
    unless @copy.user_id == current_user.id
      raise "Cannot return other people's books!"
    end
    @copy.user_id = nil
    @copy.save
    redirect_to book_path(@copy.book_id)
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
    params.require(:copy).permit(:user_id, :due_date)
  end
end
