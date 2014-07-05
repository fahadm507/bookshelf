class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
      flash[:notice] = "Your book has been saved!"
    else
      flash.now[:notice] = "Some of the fields were invalid"
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :year, :description, :category)
  end

end
