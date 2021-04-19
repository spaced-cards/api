class DeckSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name
end
