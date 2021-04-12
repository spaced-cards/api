class Deck < ApplicationRecord
  belongs_to :user_id
  belongs_to :deck_category
end
