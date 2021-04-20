class Deck < ApplicationRecord
  belongs_to :user, inverse_of: :decks
  belongs_to :deck_category, inverse_of: :decks
  has_many :cards, inverse_of: :deck, dependent: :destroy

  validates :name, :description, :difficulty, presence: true
  validates :name, :description, length: { minimum: 2, maximum: 255 }
  validates :difficulty, inclusion: 1..5
end
