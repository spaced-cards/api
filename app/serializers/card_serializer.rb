class CardSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :question, :answer
end
