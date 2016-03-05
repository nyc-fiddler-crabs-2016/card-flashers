class Deck < ActiveRecord::Base
  # Remember to create a migration!
  has_many :games
  has_many :cards

  validates :name, :description, presence: true
  validates :name, uniqueness: true

  def show_card
    self.cards.sample
  end

  def get_ids_of_cards
    id_array =[]
    self.cards.each do  |card|
      id_array << card.id
    end
    id_array
  end
  # def shuffle
  #   self.cards.shuffle
  # end

  # def put_that_damn_card_back(current_card, deck)
  #   deck << current_card
  # end
end
