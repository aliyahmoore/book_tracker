class BooksController < ApplicationController
  before_action :authenticate_user! # Ensure user is logged in
  before_action :set_book_club, only: [:index, :new, :create]
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /book_clubs/:book_club_id/books
  def index
    @books = @book_club.books
  end

  # GET /books/:id
  def show
    @notes = @book.notes
  end

  # GET /book_clubs/:book_club_id/books/new
  def new
    @book = @book_club.books.new
  end

  # POST /book_clubs/:book_club_id/books
  def create
    @book = @book_club.books.build(book_params)
    @book.user = current_user

    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /books/:id/edit
  def edit
    @book = @book_club.books.find(params[:id])
  end

  # PATCH/PUT /books/:id
  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /books/:id
  def destroy
    @book.destroy
    redirect_to book_club_books_path(@book.book_club), notice: 'Book was successfully deleted.'
  end

  private

  def set_book_club
    @book_club = BookClub.find(params[:book_club_id])
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :genre, :notes, :start_date, :end_date, :status)
  end
end
