class Card < ApplicationRecord
  belongs_to :deck, inverse_of: :cards
end
