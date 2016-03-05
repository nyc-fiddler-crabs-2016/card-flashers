class Guess < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :game
  belongs_to :card

  validates :guess_text, :game_id, :card_id, presence: true


  def correct_guess?
    self.guess_text == self.card.answer
  end


end

