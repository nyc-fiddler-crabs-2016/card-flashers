class Deck < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :game
  has_many :cards

  validates :name, :description, presence: true
  validates :name, uniqueness: true
end
