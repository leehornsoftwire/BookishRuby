class BooksController < ApplicationController
  def index
    @current_user = current_user
    # convert to array so we can sort
    title_search_string = ""
    author_search_string = ""
    unless params[:search].nil?
      search_params = params[:search]
      title_search_string = search_params["title"].nil? ? "" : search_params["title"]
      author_search_string = search_params["author"].nil? ? "" : search_params["author"]
    end
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
