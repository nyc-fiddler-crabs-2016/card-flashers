class Deck < ActiveRecord::Base
  # Remember to create a migration!
  has_many :games
  has_many :cards

  validates :name, :description, presence: true
  validates :name, uniqueness: true
end
