class Api::V1::CardsController < ApplicationController
  def index
    # XXX: this method is going to be a problem down the road, but eh ¯\_(ツ)_/¯
    random_card_ids = deck.cards.pluck(:id).shuffle.take(5)
    @cards = deck.cards.where(id: random_card_ids)
    render json: CardSerializer.new(@cards)
  end

  private

  def deck_category
    DeckCategory.find(params[:deck_category_id])
  end

  def deck
    deck_category.decks.find(params[:deck_id])
  end

  def index_filters
    @index_filters ||= index_filters_params
  end
end
