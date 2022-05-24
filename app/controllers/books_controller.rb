class BooksController < ApplicationController
  def new
  end

  def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book),notice: "You have created book successfully."
    else
        render action: :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @newbook = Book.new
    @books =Book.all
    @book =Book.find(params[:id])
    @user = current_user
  end

  def destroy
    @book =Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @books =Book.find(params[:id])
    @users =User.all
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book),notice: "You have updated book successfully."
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id, :image)
  end
end
