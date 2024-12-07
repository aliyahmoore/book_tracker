class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book_clubs, only: [:new, :edit]

  # GET /books
  def index
    @books = Book.all
  end

  # GET /books/:id
  def show
    @book = Book.find(params[:id])
  end

  # GET /books/new
  def new
    @book = current_user.books.new
  end

  # POST /books
  def create
    @book = current_user.books.new(book_params)

    if @book.save
      redirect_to @book
    else
      set_book_clubs
      render :new, status: :unprocessable_entity
    end
  end

  # GET /books/:id/edit
  def edit
    @book = current_user.books.find(params[:id])
  end

  # PATCH/PUT /books/:id
  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to @book
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path, notice: 'Book was successfully deleted.'
  end

  private
  def set_book
    @book = current_user.books.find(params[:id])
  end

  def set_book_clubs
    @book_clubs = current_user.book_clubs
  end

  def book_params
    params.require(:book).permit(:title, :author, :genre, :status, :book_club_id, :notes, :start_date, :end_date)
  end
end
