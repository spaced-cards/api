class DeckCategory < ApplicationRecord #:nodoc:
  has_many :decks, inverse_of: :deck_category, dependent: :destroy
end
