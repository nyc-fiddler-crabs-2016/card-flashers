class Deck < ActiveRecord::Base
  # Remember to create a migration!
  has_many :games
  has_many :cards

  validates :name, :description, presence: true
  validates :name, uniqueness: true

  def play_card
    self.cards.shift
  end

  def shuffle
    self.cards.shuffle
  end

  def put_that_damn_card_back(current_card, deck)
    deck << current_card
  end
end
