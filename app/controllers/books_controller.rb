class BooksController < ApplicationController
  before_action :authenticate_user!

  # GET /books
  def index
    @books = current_user.book_clubs.includes(:books).flat_map(&:books)
  end

  # GET /books/:id
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
    @book_clubs = current_user.book_clubs # Allow the user to choose from their book clubs
  end

  # POST /books
  def create
    @book = Book.new(book_params)
    @book.user = current_user

    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      @book_clubs = current_user.book_clubs # If creation fails, re-render with book clubs
      render :new
    end
  end

  # GET /books/:id/edit
  def edit
    @book_clubs = current_user.book_clubs # Allow the user to choose from their book clubs
  end

  # PATCH/PUT /books/:id
  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      @book_clubs = current_user.book_clubs # If update fails, re-render with book clubs
      render :edit
    end
  end

  # DELETE /books/:id
  def destroy
    @book.destroy
    redirect_to books_path, notice: 'Book was successfully deleted.'
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :genre, :status, :book_club_id)
  end
end
