class Game < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :guess
  belongs_to :user
  has_one :deck
  has_many :cards, through: :deck
end
