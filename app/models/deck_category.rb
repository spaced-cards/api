class DeckCategory < ApplicationRecord #:nodoc:
  has_many :decks, inverse_of: :deck_category, dependent: :destroy

  validates :name, :description, presence: true
  validates :name, :description, length: { minimum: 2, maximum: 255 }
end
