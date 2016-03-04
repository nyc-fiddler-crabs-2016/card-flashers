class Guess < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :game
  belongs_to :card

  validates :guess_text, presence: true
end
