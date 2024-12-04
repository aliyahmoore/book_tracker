class BookClubsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book_club, only: [:show, :edit, :update, :destroy]

  # GET /book_clubs
  def index
    @book_clubs = current_user.book_clubs
  end

  # GET /book_clubs/:id
  def show
    @books = @book_club.books
  end

  # GET /book_clubs/new
  def new
    @book_club = BookClub.new
  end

  # POST /book_clubs
  def create
    @book_club = BookClub.new(book_club_params)
    if @book_club.save
      redirect_to @book_club, notice: 'Book Club was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /book_clubs/:id/edit
  def edit
  end

  # PATCH/PUT /book_clubs/:id
  def update
    if @book_club.update(book_club_params)
      redirect_to @book_club, notice: 'Book club was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /book_clubs/:id
  def destroy
    @book_club.destroy
    redirect_to book_clubs_path, notice: 'Book club was successfully deleted.'
  end

  private

  def set_book_club
    @book_club = BookClub.find(params[:id])
  end

  def book_club_params
    params.require(:book_club).permit(:name, :description)
  end
end
