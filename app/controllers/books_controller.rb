class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @books = current_user.books.page(params[:page])
  end

  def show
    @user = @book.user
    @comments = @book.comments
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      redirect_to @book, notice: t("common.flash.create")
    else
      render :new
    end
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: t("common.flash.update")
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url, notice: t("common.flash.destroy")
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :memo, :author, :picture)
    end
end
