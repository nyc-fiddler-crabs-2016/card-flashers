class Game < ActiveRecord::Base
  # Remember to create a migration!
  has_many :guesses
  belongs_to :user
  belongs_to :deck
  has_many :cards, through: :deck




end
