# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
DeckCategory.destroy_all

user = User.create!(email: "cookie@spaced.cards", password: "pass4bunny")
deck_category = DeckCategory.create!(name: "Geography")
deck = Deck.create!(name: "Capitals of Europe", description: "The capitals of Europe", difficulty: 1, user: user, deck_category: deck_category)

Card.create!(deck: deck, question: "Belgium", answer: "Brussels")
Card.create!(deck: deck, question: "Luxembourg", answer: "Luxembourg")
Card.create!(deck: deck, question: "Spain", answer: "Madrid")
Card.create!(deck: deck, question: "Germany", answer: "Berlin")
Card.create!(deck: deck, question: "Sweden", answer: "Stockholm")
Card.create!(deck: deck, question: "Ireland", answer: "Dublin")
Card.create!(deck: deck, question: "France", answer: "Paris")
Card.create!(deck: deck, question: "Italy", answer: "Rome")
Card.create!(deck: deck, question: "Finland", answer: "Helsinky")
Card.create!(deck: deck, question: "Iceland", answer: "Reykjavik")
