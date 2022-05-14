class BooksController < ApplicationController
  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @newbook = Book.new
    @book =Book.find(params[:id])
    @user = current_user
  end

  def destroy
    @book =Book.find(params[:id])
    @book.destroy
    redirect_to'/show'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id, :image)
  end
end
