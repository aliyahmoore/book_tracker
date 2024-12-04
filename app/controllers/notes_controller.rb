class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book
  before_action :set_note, only: [:edit, :update, :destroy]

  # GET /books/:book_id/notes
  def index
    @notes = @book.notes
  end

  # GET /books/:book_id/notes/new
  def new
    @note = @book.notes.build
  end

  # POST /books/:book_id/notes
  def create
    @note = @book.notes.build(note_params)
    @note.user = current_user

    if @note.save
      redirect_to book_notes_path(@book), notice: 'Note was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /notes/:id/edit
  def edit
  end

  # PATCH/PUT /notes/:id
  def update
    if @note.update(note_params)
      redirect_to book_notes_path(@note.book), notice: 'Note was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /notes/:id
  def destroy
    @note.destroy
    redirect_to book_notes_path(@note.book), notice: 'Note was successfully deleted.'
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:content)
  end
end
