class Game < ActiveRecord::Base
  # Remember to create a migration!
  has_many :guesses
  belongs_to :user
  belongs_to :deck
  has_many :cards, through: :deck

  def stats
    deck_size = self.deck.cards.count
    guesses = self.guesses.count

    "It took you #{guesses} guesses to answer #{deck_size} cards. You had #{self.first_guesses} cards right on the first guess."
  end

  def judge_them
    deck_size = self.deck.cards.count
    guesses = self.guesses.count

    if (deck_size / guesses) > 0.8
      return "Nice job! It took you #{guesses} guesses to answer #{deck_size} cards."
     elsif (deck_size / guesses) > 0.6
      return "Soooooooo that was kinda weak. It took you #{guesses} guesses to answer #{deck_size} cards."
     elsif (deck_size / guesses) > 0.5
      return "Are you trying to learn? Or just trying to look busy. It took you #{guesses} guesses to answer #{deck_size} cards. "
     elsif  (deck_size / guesses) < 0.5
      return "It took you #{guesses} guesses to answer #{deck_size} cards. I'm not angry, I'm just disappointed."
    end
  end
end
