class Game < ActiveRecord::Base
  # Remember to create a migration!
  has_many :guesses
  belongs_to :user
  belongs_to :deck
  has_many :cards, through: :deck

  def stats
    deck_size = self.deck.cards.count
    guesses = self.guesses.count

    if (deck_size / guesses) > .8
      "Nice job! It took you #{guesses} guesses to answer #{deck_size} cards."
     elsif (deck_size / guesses) > .6
      "Soooooooo that was kinda weak. It took you #{guesses} guesses to answer #{deck_size} cards."
     elsif deck_size / guesses > .5
      "Are you trying to learn? Or just trying to look busy. It took you #{guesses} guesses to answer #{deck_size} cards. "
    end
  end
end
