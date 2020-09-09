class BooksController < ApplicationController
  def index
    @books = Book.all()
  end
  def new
    @book = Book.new
  end
  def create
    @book = Book.new(book_params())
    if @book.save()
      redirect_to @book
    else
      render 'new'
    end
  end
  def update 
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to edit_book_url
    else
      redirect_to @book
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end
  private
  def book_params
    params.require(:book).permit(:title,:author,:isbn)
  end
end
