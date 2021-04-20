FactoryBot.define do
  factory :deck_category do
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph(sentence_count: (2..5).to_a.sample) }
  end
end

