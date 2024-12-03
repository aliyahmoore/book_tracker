class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  def index
    @notes = Note.all
  end

  # GET /notes/:id
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # POST /notes
  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to @note, notice: 'Note was successfully created.'
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
      redirect_to @note, notice: 'Note was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /notes/:id
  def destroy
    @note.destroy
    redirect_to notes_url, notice: 'Note was successfully destroyed.'
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:book_id, :user_id, :book_club_id, :content)
  end
end
