class BookClub < ApplicationRecord
  belongs_to :user
  has_many :books, dependent: :destroy

  validates :name, :description, presence: true
end
