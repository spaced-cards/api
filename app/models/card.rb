class Card < ApplicationRecord
  belongs_to :deck, inverse_of: :cards
  validates :question, :answer, presence: true
  validates :question, :answer, length: { minimum: 2, maximum: 255 }

end
