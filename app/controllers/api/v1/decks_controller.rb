class Api::V1::DecksController < ApplicationController
  def index
    @decks = Deck.where(index_filters)
    render json: DeckSerializer.new(@decks)
  end

  private

  def index_filters
    @index_filters ||= index_filters_params
  end

  def index_filters_params
    filters = {}
    filters[:deck_category_id] = params.dig(:filter, :deck_category_id)
    filters
  end
end
