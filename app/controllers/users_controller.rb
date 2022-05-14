class UsersController < ApplicationController
  def show
    @user = Book.find(params[:id])
    @books = @user.books
  end

  def index
    @book = Book.new
    @user = current_user
    @users =User.all
  end
end
