class Deck < ApplicationRecord
  belongs_to :user
  belongs_to :deck_category
end
