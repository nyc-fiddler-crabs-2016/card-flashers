require 'faker'

5.times do
  User.create(
    user_name: Faker::Hacker.noun,
    password: "password"
    )
end

10.times do
  Deck.create(
    name: Faker::Hacker.noun,
    description: Faker::Hacker.say_something_smart

    )
end


50.times do
  Card.create(
    question: Faker::Hacker.say_something_smart,
    answer: "answer",
    deck_id: Deck.all.sample.id
    )
end






