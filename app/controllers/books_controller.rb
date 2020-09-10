class BooksController < ApplicationController
  def index
    @current_user = current_user
    # convert to array so we can sort
    title_search_string = params["title_search"].nil? ? "" : params["title_search"]
    author_search_string = params["author_search"].nil? ? "" : params["author_search"]
    @books = Book.order(:title)
      .where("title like ?", "%#{title_search_string}%")
      .where("author like ?", "%#{author_search_string}%")
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      render "new"
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.copies.delete_all
    book.destroy
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book
    else
      render "edit"
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
    params.require(:book).permit(:title, :author, :isbn)
  end
end
