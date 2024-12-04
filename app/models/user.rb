class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :book_clubs, dependent: :destroy
  has_many :books, through: :book_clubs
  has_many :notes, dependent: :destroy

  validates :username, presence: true
end
