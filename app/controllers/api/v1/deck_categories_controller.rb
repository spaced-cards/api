class Api::V1::DeckCategoriesController < ApplicationController
  def index
    @deck_categories = DeckCategory.all.limit(100)
    render json: DeckCategorySerializer.new(@deck_categories)
  end
end
