class Book < ApplicationRecord
  belongs_to :book_club
  has_many :notes, dependent: :destroy

  validates :title, :genre, :author, presence: true
end
