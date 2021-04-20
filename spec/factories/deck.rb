FactoryBot.define do
  factory :deck do
    user
    name { "MyString" }
    description { "MyString" }
    deck_category
    difficulty { 1 }
  end
end

