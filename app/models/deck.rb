class Deck < ApplicationRecord
  belongs_to :user, inverse_of: :decks
  belongs_to :deck_category, inverse_of: :decks
  has_many :cards, inverse_of: :deck, dependent: :destroy
end
