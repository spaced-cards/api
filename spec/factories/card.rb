FactoryBot.define do
  factory :card do
    deck
    question { "Who said «#{ Faker::TvShows::HowIMetYourMother.quote }»" }
    answer { Faker::TvShows::HowIMetYourMother.character }
  end
end
