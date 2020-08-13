class Users::BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @books = @user.books.page(params[:page])
  end
end
