class BookClub < ApplicationRecord
  belongs_to :user
  has_many :books
  has_many :notes, through: :books
end
