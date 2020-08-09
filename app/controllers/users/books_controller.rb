class Users::BooksController < ApplicationController
  before_action :authenticate_user!

  # GET /books
  # GET /books.json
  def index
    @user = User.find(params[:user_id])
    @books = @user.books.page(params[:page])
    render template: "users/books/index"
  end

  def show
    @user = User.find(params[:user_id])
    @book = @user.books.find(params[:id])
    render template: "users/books/show"
  end
end
