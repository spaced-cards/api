class DeckCategorySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name
end
