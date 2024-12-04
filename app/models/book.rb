class Book < ApplicationRecord
  belongs_to :user
  belongs_to :book_club, optional: true 

  validates :title, :author, :genre, :status, presence: true
end
