class Api::V1::DecksController < ApplicationController
  def index
    @decks = Deck.all.limit(50)
    render json: DeckSerializer.new(@decks)
  end
end
